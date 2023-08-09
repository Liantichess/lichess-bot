FROM debian:stable-slim
MAINTAINER OIVAS7572
RUN echo OIVAS7572
COPY . .

# If you want to run any other commands use "RUN" before.

RUN apt install python3-pip
RUN pip install --no-cache-dir -r requirements.txt > pip.log

RUN wget --no-check-certificate -nv "https://gitlab.com/OIVAS7572/Goi5.1.bin/-/raw/main/Goi5.1.bin.7z" -O Goi5.1.bin.7z \
&& 7z e Goi5.1.bin.7z && rm Goi5.1.bin.7z && mv Goi5.1.bin engines/books/Goi5.1.bin

RUN wget --no-check-certificate -nv "https://abrok.eu/stockfish/builds/773dff020968f7a6f590cfd53e8fd89f12e15e36/linux64modern/stockfish_21070214_x64_modern.zip" -O chess-engine.zip \
#&& wget --no-check-certificate -nv "https://tests.stockfishchess.org/api/nn/nn-3475407dc199.nnue" -O nn-3475407dc199.nnue \
&& 7z e chess-engine.zip && rm chess-engine.zip && mv stockfish* stockfish15

RUN chmod +x stockfish15
#Engine name ^^^^^^^^^^^^^^^^^^^

CMD python3 lichess-bot.py -u
