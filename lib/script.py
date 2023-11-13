# script.py
import sys

def process_image(image_path):
    # Your image processing logic goes here
    # For demonstration, this script simply prints the image path
    print(f"Processing image: {image_path}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python script.py <image_path>")
        sys.exit(1)

    image_path = sys.argv[1]
    process_image(image_path)
