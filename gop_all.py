import glob
import gop


def main():
    for extension in ['mp4', 'flv', 'avi', 'mkv', 'mpeg', 'hevc']:
        for filename in glob.glob(f'*.{extension}'):
            gop.find_gop(filename=filename)


if __name__ == "__main__":
    main()
