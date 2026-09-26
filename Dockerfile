FROM ubuntu:22.04

# تثبيت الجافا وأدوات التحميل
RUN apt-get update && apt-get install -y wget default-jre tar

# تحميل النسخة الرسمية من محرك SmartFoxServer
RUN wget https://www.smartfoxserver.com/download/get/307 -O sfs2x.tar.gz
RUN tar -xzf sfs2x.tar.gz

# نسخ ملفات الإعدادات والزون الخاصة بك إلى مسارها الصحيح في السيرفر
COPY local.zone.xml /SmartFoxServer_2X/SFS2X/zones/
COPY server.xml /SmartFoxServer_2X/SFS2X/config/
COPY ConfigExtension.jar /SmartFoxServer_2X/SFS2X/extensions/

# فتح المنافذ المطلوبة
EXPOSE 8080
EXPOSE 9933

# الدخول لمجلد التشغيل وبدء السيرفر
WORKDIR /SmartFoxServer_2X/SFS2X
CMD ["./sfs2x.sh"]
