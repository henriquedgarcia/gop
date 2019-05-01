"""
Description: nononono
"""
import argparse
import json
import subprocess


def find_gop(filename, outfile=None, save=True):
    print(f'Processing {filename}.')

    command = (f'ffprobe '
               f'-v error '
               f'-show_entries frame=pict_type '
               f'-of default=noprint_wrappers=1:nokey=1 '
               f'"{filename}"')

    process = subprocess.run(command, encoding='utf-8', stdout=subprocess.PIPE, stderr=subprocess.STDOUT, check=True)

    out = {'max_gop': 0, 'gop': ''}
    count = 0
    for pic_type in process.stdout.split('\n'):
        if pic_type in 'I':
            if count > out['max_gop']:
                out['max_gop'] = count
            if out['max_gop'] != 0:
                out['gop'] += '\n'
            count = 1
        else:
            count += 1
        out['gop'] += pic_type

    print(f'Max I distance is {out["max_gop"]} frames.')
    print(f'GOP: \n{out["gop"]}')

    if save is True:
        if outfile is None:
            outfile = '.'.join(filename.split('.')[:-1]) + '.json'
        with open(outfile, 'w') as f:
            json.dump(out, f, indent=2)

    return out


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Display and save GOP structure',
                                     formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument("filename", type=str, help="Video to analyze")
    parser.add_argument("--outfile", type=str, default=None, help="json filename to save.")
    params = vars(parser.parse_args())

    find_gop(**params)
