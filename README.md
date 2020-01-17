# elasticsearch-bootstrap
Bootstrap your Elasticsearch installation real quick for dev purpose!

## Requirements

### MacOS

- `brew install coreutils`

## Usage

1) `chmod u+x ./bootstrap.sh` if needed
2) Execute `./bootstrap.sh`
3) Follow the instructions to bootstrap your Elasticsearch installation!

> Note: 
> 1) You can even add a symlink to call the script from any directory:  
> `sudo ln -s ~/code/elasticsearch-bootstrap/bootstrap.sh /usr/bin/esdl`
> 
> 2) Or add an alias in your shell config  
> `alias esdl="~/code/elasticsearch-bootstrap/bootstrap.sh"` (need to `source` reload your config after adding the line)
>
> Then use `esdl` to trigger the script.

## Features
 - Mac & Linux compatible
 - OS auto-detection
 - Simple Elasticsearch / Kibana installation wizard
 - Stack versions check
 - Custom directory installation
 - Services auto-startup (Elasticsearch & Kibana)

## Todos
 - Add args support for `./bootstrap.sh` (e.g. `./bootstrap.sh --interactive`)
 - Add USAGE (`./boostrap.sh --help`)
 

