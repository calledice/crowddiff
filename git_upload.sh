#!/bin/bash

# 设置颜色变量以提高输出可读性
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# 检查是否提供了提交信息
if [ -z "$1" ]; then
    echo -e "${RED}Error: Please provide a commit message.${NC}"
    exit 1
fi

# 获取当前分支名称
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

# 确保在 Git 仓库中
if [ ! -d ".git" ]; then
    echo -e "${RED}Error: This script should be run from the root of a Git repository.${NC}"
    exit 1
fi

# 添加所有更改到暂存区
echo -e "${GREEN}Adding all changes to the staging area...${NC}"
git add .

# 提交更改
echo -e "${GREEN}Committing changes with message: $1${NC}"
git commit -m "$1"

# 检查是否有未提交的更改
if [ $? -ne 0 ]; then
    echo -e "${RED}Error: Failed to commit changes.${NC}"
    exit 1
fi

# 推送到远程仓库
echo -e "${GREEN}Pushing changes to remote branch: ${CURRENT_BRANCH}${NC}"
git push origin $CURRENT_BRANCH

# 检查推送是否成功
if [ $? -ne 0 ]; then
    echo -e "${RED}Error: Failed to push changes.${NC}"
    exit 1
else
    echo -e "${GREEN}Successfully pushed changes to remote branch: ${CURRENT_BRANCH}${NC}"
fi

exit 0