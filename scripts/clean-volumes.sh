docker volume ls | grep age | awk '{print $2}' | xargs docker volume rm
