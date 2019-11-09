#!/bin/bash

check_os_version()
{
    echo -e "Not implemented yet...\r\n"
}

check_es_version()
{
    base_url="https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-"

    case $1 in
        1)
            suffix_url="-linux-x86_64.tar.gz"
            ;;
        2)
            suffix_url="-darwin-x86_64.tar.gz"
            ;;
    esac

    full_url="$base_url$2$suffix_url"
    http_response=`curl -I "$full_url" 2>/dev/null | head -n 1 | cut -d$' ' -f2`


    if [[ $http_response == 200 ]]; then
        echo "Elasticsearch version $2 found for $osname!"
    else
        echo "Elasticsearch version $2 not found for $osname! :/"
    fi
}