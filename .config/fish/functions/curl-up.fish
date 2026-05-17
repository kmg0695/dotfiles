function curl-up -d "Upload file to x0.at and copy URL to clipboard"
    if test (count $argv) -eq 0
        echo "Usage: curl-up <file>"
        return 1
    end

    if test (count $argv) -gt 1
        echo "Usage: curl-up <file>"
        return 1
    end

    set -l file $argv[1]

    if not test -f $file
        echo "File not found: $file"
        return 1
    end

    set -l file_size (stat -f%z $file)

    set -l max_size 536870912

    # Check if file size exceeds limit
    if test $file_size -gt $max_size
        echo no
        return 1
    end

    # Upload and copy to clipboard
    curl -F "file=@$file" https://x0.at/ | pbcopy
end
