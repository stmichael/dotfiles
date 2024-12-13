link_file() {
    SOURCE=$(absolute_path "$1")
    TARGET=$(absolute_path "$2")

    if [[ -h $TARGET ]]; then
        echo "- $1: ignoring. $2 is already a symbolic link."
        return 0
    fi
    if [[ -f $TARGET ]]; then
        echo "- $1: fail. $2 already exists." >&2
        return 1
    fi

    echo "- $1: linking to $2"
    ln -sf "$SOURCE" "$TARGET"
}

absolute_path() {
    NAME=$(basename "$1")
    DIR="$(dirname "$1")"
    ABSOLUTE_PATH="$(cd "$DIR" && pwd)"
    echo "$ABSOLUTE_PATH/$NAME"
}
