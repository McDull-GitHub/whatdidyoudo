#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 /path/to/bin"
    exit 1
fi

myshell=$(basename $SHELL)

if [ ! -d $HOME/.fake/bin ]; then
    mkdir -p $HOME/.fake/bin
    cat >>$HOME/.myshellrc <<'EOF'
export PATH=$HOME/.fake/bin:$PATH
EOF
fi

name=$(basename $1)

cat >$HOME/.fake/bin/$name <<'EOF'
#!/bin/bash
echo $0 $@ >> ~/Downloads/logs.txt
EOF

cat >>$HOME/.fake/bin/$name <<EOF
$1 \$@
EOF

chmod 755 $HOME/.fake/bin/$name
