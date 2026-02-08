# Use the official Nginx image as a base image
FROM nginx

# Set the working directory to the Nginx HTML directory
WORKDIR /usr/share/nginx/html

# Copy the contents of the current directory to the Nginx HTML directory
COPY . .

# Expose port 80
EXPOSE 80

# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]  