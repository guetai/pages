#!/bin/bash

# 执行 git pull
echo "Pulling latest changes from the repository..."
git pull

# 检查是否拉取成功
if [ $? -ne 0 ]; then
    echo "Failed to pull latest changes. Aborting."
    exit 1
fi

# 执行 /template/pages/generate.sh
echo "Generating pages..."
/template/pages/generate.sh

# 检查 generate.sh 是否执行成功
if [ $? -ne 0 ]; then
    echo "Failed to generate pages. Aborting."
    exit 1
fi

# 执行 /template/index/generate.sh
echo "Generating index..."
/template/index/generate.sh

# 检查 generate.sh 是否执行成功
if [ $? -ne 0 ]; then
    echo "Failed to generate index. Aborting."
    exit 1
fi

# 将更改添加到 Git
echo "Adding changes to Git..."
git add .

# 提交更改
echo "Committing changes..."
git commit -m "deploy pages"

# 检查提交是否成功
if [ $? -ne 0 ]; then
    echo "Failed to commit changes. Aborting."
    exit 1
fi

# 推送到 GitHub
echo "Pushing changes to GitHub..."
git push

# 检查推送是否成功
if [ $? -ne 0 ]; then
    echo "Failed to push changes to GitHub. Aborting."
    exit 1
fi

echo "Deployment completed successfully!"