FROM ubuntu:22.04

# تثبيت الجافا وأدوات التحميل وإصلاح النصوص
RUN apt-get update && apt-get install -y wget default-jre tar dos2unix

# تحميل النسخة الرسمية من محرك SmartFoxServer
RUN wget https://www.smartfoxserver.com/download/get/307 -O sfs2x.tar.gz
RUN tar -xzf sfs2x.tar.gz

# نسخ ملفات الإعدادات والزون الخاصة بك إلى مسارها الصحيح في السيرفر
COPY local.zone.xml /SmartFoxServer_2X/SFS2X/zones/
COPY server.xml /SmartFoxServer_2X/SFS2X/config/
COPY ConfigExtension.jar /SmartFoxServer_2X/SFS2X/extensions/

# تحويل ملف التشغيل ليتوافق مع نظام لينكس وإعطائه صلاحيات التنفيذ
WORKDIR /SmartFoxServer_2X/SFS2X
RUN dos2unix sfs2x.sh && chmod +x sfs2x.sh

# فتح المنافذ المطلوبة
EXPOSE 8080
EXPOSE 9933

# بدء تشغيل السيرفر
CMD ["./sfs2x.sh"]
