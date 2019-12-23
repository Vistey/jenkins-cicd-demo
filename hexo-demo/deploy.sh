#!/bin/sh

git reset --hard HEAD
git pull origin test/hexo

program_name=hexo-demo
program_version=$(date "+%Y%m%d%H%M%S")
program_port=4000

image_name=${program_name}:${program_version}

echo $image_name

docker build -t ${image_name} .

remove_images=$(docker ps -a -q -f name=/${program_name}_)
remove_images_length=${#remove_images[n]}
echo remove images list: ${remove_images}, length: $remove_images_length

if [ ${remove_images_length} -gt 0 ]; then
  echo removing...
  docker rm -f ${remove_images}
fi

docker run -d --name=${program_name}_${program_version} -p ${program_port}:4000 ${image_name}
