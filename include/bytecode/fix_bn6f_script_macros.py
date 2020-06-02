
def fix_file(filename):
    with open(filename, "r") as f:
        output = ""
        for line in f:
            if line.startswith("\t.macro"):
                split_line = line.replace(",", "").split()
                if len(split_line) == 2:
                    output += line
                else:
                    output += f"\t.macro {', '.join(split_line[1:])}\n"
            else:
                output += line

    with open(filename, "w+") as f:
        f.write(output)

def main():
    fix_file("cutscene_script.inc")
    fix_file("cutscene_camera_script.inc")
    fix_file("npc_script.inc")

if __name__ == "__main__":
    main()

