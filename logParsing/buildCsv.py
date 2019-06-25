import glob
import os
import sys

def main():
    if len(sys.argv) < 2:
        print("python buildCsv.py [benchArgId] [inFolder1] [inFolder2] [inFolder3] ... [inFolderN]", file=sys.stderr)
        return
    benchArg = int(sys.argv[1])
    sys.argv = sys.argv[2:]
    baseDir = os.curdir
    for inFolder in sys.argv:
        os.chdir(baseDir)
        os.chdir(inFolder)
        print("name status time real satpart round")
        for errFile in glob.glob("err-*"):
            jobId = errFile[4:-4]
            satUnsatResult = {}
            with open("out-"+jobId+".log") as f:
                content = f.readlines()
                entered = False
                fileName = None
                for line in content:
                    if line.startswith("[runner] "):
                        if not entered:
                            satUnsatResult[fileName]="UNKNOWN"
                        fileName = line.strip()[9:]
                        entered=False
                    else:
                        if entered:
                            continue
                        if line.upper().startswith("SAT"):
                            satUnsatResult[fileName] = "SAT"
                            entered = True
                        elif line.upper().startswith("UNSAT"):
                            satUnsatResult[fileName] = "UNSAT"
                            entered = True
                        elif line.upper().startswith("UNKNOWN"):
                            satUnsatResult[fileName] = "UNKNOWN"
                            entered = True
                        elif line.upper().startswith("[BTOR>MAIN] CAUGHT SIGNAL 15"):
                            satUnsatResult[fileName] = "UNKNOWN"
                            entered = True
                        else:
                            print("Cannot parse line in "+jobId+": "+line, file=sys.stderr)
            if not entered:
                satUnsatResult[fileName] = "UNKNOWN"
            with open(errFile) as f:
                content = f.readlines()
                first = True
                for line in content:
                    if line.startswith("[runlim] version:"): #NEW
                        if not first:
                            if satPart is None:
                                satPart = "0"
                            print(benchmark.strip()+" "+satUnsat.strip()+" "+str(int(float(time.strip())*100))+" "+str(int(float(real.strip())*100))+" "+str(int(float(satPart.strip())*1000000))+" "+str(roundNum))
                        else:
                            first = False
                        benchmark = None
                        time = 0
                        real = 0
                        satPart = None
                        satUnsat = None
                        roundNum = 0
                    parts = line.strip().split("\t\t")
                    if line.startswith("[runlim] argv["+str(benchArg)+"]"):
                        benchmark = parts[-1]
                        if benchmark not in satUnsatResult:
                            print("Could not find sat/unsat result for "+benchmark+" in "+jobId, file=sys.stderr)
                            first=True
                            continue
                        satUnsat = satUnsatResult[benchmark]
                    elif line.startswith("[runlim] time:"):
                        time = parts[-1].split(" ")[0]
                    elif line.startswith("[runlim] real:"):
                        real = parts[-1].split(" ")[0]
                    elif line.startswith("[Ablector] INFO: ABLECTOR TIME:"):
                        parts = line.strip().strip().split(" ")
                        satPart = parts[-1]
                    elif line.startswith("[BTOR>check_sat]"):
                        parts = line.strip().split(" ")
                        satPart = parts[1]
                    elif line.startswith("[Ablector] INFO: *** ROUND "):
                        parts = line.strip().split(" ")
                        roundNum = parts[-1]
                if not first:
                    if satPart is None:
                        satPart = time
                    print(benchmark.strip()+" "+satUnsat.strip()+" "+str(int(float(time.strip())*100))+" "+str(int(float(real.strip())*100))+" "+str(int(float(satPart.strip())*1000000))+" "+str(roundNum))



if __name__ == "__main__":
    main()