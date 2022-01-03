FROM rhub/r-minimal
RUN installr praise
CMD [ "R", "--slave", "-e", "cat(praise::praise())" ]

FROM rhub/r-minimal
RUN installr -d glue

FROM rhub/r-minimal
RUN installr -d -t linux-headers pingr
CMD [ "R", "-q", "-e", "pingr::is_online() || stop('offline')" ]
