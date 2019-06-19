import glob
import os
import sys

def main():
    if len(sys.argv) < 5:
        print("python buildCsv.py [benchArgId] [inFolder1] [inFolder2] [inFolder3] ... [inFolderN] [levelHistFile] [bitHistFile]", file=sys.stderr)
        return
    benchArg = int(sys.argv[1])
    levelHistFile = sys.argv[-2]
    bitHistFile = sys.argv[-1]
    sys.argv = sys.argv[2:-2]
    baseDir = os.curdir
    with open(levelHistFile, "w") as levelF:
        with open(bitHistFile, "w") as bitF:
            for inFolder in sys.argv:
                os.chdir(baseDir)
                os.chdir(inFolder)
                print("name status level", file=levelF)
                print("name status bit", file=bitF)
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
                        for line in content:
                            if line.startswith("[runlim] version:"): #NEW
                                benchmark = None
                                satUnsat = None
                            elif line.startswith("[MulNode] INFO: Level "): #NEW
                                parts = line.strip().split(" ")
                                level = parts[3]
                                print(benchmark.strip()+" "+satUnsat.strip()+" "+level, file=levelF)
                                if int(level) == 2:
                                    bit = parts[-1]
                                    print(benchmark.strip()+" "+satUnsat.strip()+" "+bit, file=bitF)
                                continue
                            elif line.startswith("[runlim] argv["+str(benchArg)+"]"):
                                parts = line.strip().split("\t\t")
                                benchmark = parts[-1]
                                if benchmark not in satUnsatResult:
                                    print("Could not find sat/unsat result for "+benchmark+" in "+jobId, file=sys.stderr)
                                    continue
                                satUnsat = satUnsatResult[benchmark]



if __name__ == "__main__":
    main()