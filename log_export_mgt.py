import argparse

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--verbosity", required=True, help="increase output verbosity")
    args = parser.parse_args()
    if args.verbosity:
        print(args.verbosity)

if __name__ == "__main__":
    main()    