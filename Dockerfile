FROM ubuntu:22.04

# تثبيت الجافا وأدوات التحميل
RUN apt-get update && apt-get install -y wget default-jre tar

# تحميل النسخة الرسمية من محرك SmartFoxServer
RUN wget https://www.smartfoxserver.com/download/get/307 -O sfs2x.tar.gz

# فك الضغط عن الملفات
RUN tar -xzf sfs2x.tar.gz

# فتح المنافذ المطلوبة
EXPOSE 8080
EXPOSE 9933

# الدخول لمجلد التشغيل وبدء السيرفر
WORKDIR /SmartFoxServer_2X/SFS2X
CMD ["./sfs2x.sh"]
