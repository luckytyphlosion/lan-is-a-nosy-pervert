
def main():
    with open("map_script.inc", "r") as f:
        output = ""
        for line in f:
            if line.startswith("\t.macro"):
                split_line = line.replace(",", "").split()
                if len(split_line) == 2:
                    output += line
                else:
                    output += f"\t.macro {', '.join(split_line[1:])}\r\n"
            else:
                output += line

    with open("map_script_out.inc", "w+") as f:
        f.write(output)

if __name__ == "__main__":
    main()

