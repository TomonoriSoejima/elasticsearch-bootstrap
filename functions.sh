#!/bin/bash

check_os_version()
{
    echo -e "Not implemented yet...\r\n"
}

check_es_version()
{
    base_url="https://artifacts.elastic.co/downloads/elasticsearch/"

    case $1 in
        1)
            filename="elasticsearch-$2-linux-x86_64.tar.gz"
            ;;
        2)
            filename="elasticsearch-$2-darwin-x86_64.tar.gz"
            ;;
    esac

    full_url="$base_url$filename"
    http_response=`curl -I "$full_url" 2>/dev/null | head -n 1 | cut -d$' ' -f2`

    if [[ $http_response == 200 ]]; then
        echo -e "${GREEN}Elasticsearch version $2 found for $osname!${NC}\r\n"
        break
    else
        echo -e "${RED}Elasticsearch version $2 not found for $osname! :/${NC}\r\n"
    fi
}

check_install_dir()
{
    if [ -d "$1" ]; then
        echo -e "${GREEN}$1 is a directory.${NC}\r\n"
        break
    else
        echo -e "${RED}$1 is not a directory.${NC}\r\n"
    fi  
}

download_es()
{
    if [ -f "$installdir/$filename" ]; then
        echo -e "${RED} Elasticsearch archive file already exists in this location. Skip.${NC}\r\n"
    else
        echo "Downloading Elasticsearch ($esversion) for $osname..."
        cd $1 && curl -O $full_url
        dl_res=$?

        if test "$dl_res" == "0"; then
            echo -e "${GREEN}Download completed successfully!${NC}\r\n"
        else
            echo -e "${RED}Download failed for some reasons.${NC}\r\n"
            exit 1
        fi
    fi
}

extract_es()
{
    echo "Extracting Elasticsearch from the archive..."
    es_archive_path="$1/$2"
    tar xzvf "$es_archive_path" --directory "$1"
    tar_res=$?

    if test "$tar_res" == "0"; then
        echo -e "${GREEN}Elasticsearch extracted successfully!${NC}\r\n"
    else
        echo -e "${RED}Elasticsearch extraction failed.${NC}\r\n"
        exit 1
    fi
}

delete_es_archive()
{
    echo "Deleting Elasticsearch archive file..."
    rm -v "$es_archive_path"
    rm_res=$?

    if test "$rm_res" == "0"; then
        echo -e "${GREEN}Elasticsearch archive file removed successfully!${NC}\r\n"
    else
        echo -e "${RED}Elasticsearch archive file deletion failure.${NC}\r\n"
        exit 1
    fi
}