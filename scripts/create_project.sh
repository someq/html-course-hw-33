#!/bin/bash

if [ -z "${1}" ]; then
    echo "No project name provided"
    exit 0
fi

if [ ! -z "${2}" ]; then
    PROJECT_NAME=${2}_${1}
else
    PROJECT_NAME=homework_${1}
fi

if [ -d ${PROJECT_NAME} ]; then
    echo "Project already exists"
    exit 0
fi

# можно без mkdir?
echo "Creating ${PROJECT_NAME}"
cp -r ./project-base/ ${PROJECT_NAME}
echo "Done"
echo "Updating archive script"
cat > ${PROJECT_NAME}/zip.sh << EOF
#!/bin/bash

if [ ! -z "\${1}" ]; then
    VERSION=_v_\${1}
fi

ARCHIVE_NAME=html_group_8_${PROJECT_NAME}_farid_khalikov\${VERSION}.zip

if [ -f \${ARCHIVE_NAME} ]; then
    echo "Version already exists"
else
    zip -r \${ARCHIVE_NAME} project
fi
EOF
echo "Done"
