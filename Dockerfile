FROM boot2docker/boot2docker

RUN echo "/etc/rc.d/opennebula-context" >> $ROOTFS/opt/bootscript.sh
RUN sed -i 's/^MAGIC=.*$/MAGIC=""/' $ROOTFS/etc/rc.d/automount

ADD opennebula-context $ROOTFS/etc/rc.d/opennebula-context

RUN /make_iso.sh
CMD ["cat", "boot2docker.iso"]
