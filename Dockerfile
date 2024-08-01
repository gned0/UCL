FROM python:3.9-slim

WORKDIR /app

RUN apt-get update && apt-get install -y build-essential

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENTRYPOINT ["python", "main.py"]
CMD ["--data_dir", "../Data/", "--log_dir", "../logs/", "-c", "configs/simsiam_c10.yaml", "--ckpt_dir", "./checkpoints/cifar10_results/", "--hide_progress"]