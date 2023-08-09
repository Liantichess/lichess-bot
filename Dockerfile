FROM ubuntu:jammy
MAINTAINER OIVAS7572
RUN echo OIVAS7572
COPY . .

# If you want to run any other commands use "RUN" before.

RUN apt-get update && apt-get upgrade -y && apt-get install -y wget unzip python3 python3-pip

RUN python3 -m pip install --no-cache-dir -r requirements.txt

RUN wget "https://gitlab.com/OIVAS7572/Goi5.1.bin/-/raw/main/Goi5.1.bin.7z" -O Goi5.1.bin.7z \
&& 7z e Goi5.1.bin.7z && rm Goi5.1.bin.7z && mv Goi5.1.bin engines/books/Goi5.1.bin

RUN wget https://abrok.eu/stockfish/latest/linux/stockfish_x64_bmi2.zip -O stockfish.zip
RUN unzip stockfish.zip && rm stockfish.zip
RUN mv stockfish_* engines/stockfish && chmod +x engines/stockfish

CMD python3 lichess-bot.py -u
