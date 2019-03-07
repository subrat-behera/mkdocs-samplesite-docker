FROM python:3.7

COPY entry-point.sh /

RUN pip install mkdocs

EXPOSE 8000

ENTRYPOINT ["./entry-point.sh"]
