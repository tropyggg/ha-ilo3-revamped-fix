# ha-ilo3-revamped-fix
This Home Assistant add-on is a specialized secure web proxy designed specifically to enable seamless compatibility with the ha-hp_ilo-revamped integration./Този аддон за Home Assistant е специализиран сигурен уеб тунел (прокси), създаден специално за осигуряване на пълна съвместимост с интеграцията ha-hp_ilo-revamped.

The Problem It Solves:
Modern operating systems and core libraries within Home Assistant utilize OpenSSL 3. For security reasons, OpenSSL 3 strictly blocks communication with older hardware, throwing errors such as unsafe legacy renegotiation disabled. Because legacy HP ProLiant G7 (iLO 3) management processors do not support modern SSL/TLS secure renegotiation standards, the integration cannot connect to them directly.
Проблемът, който решава:
Модерните операционни системи и софтуерни библиотеки в Home Assistant използват OpenSSL 3. Той принудително блокира комуникацията с по-стар хардуер заради съображения за сигурност и изписва грешки от сорта на unsafe legacy renegotiation disabled. Тъй като сървърите от поколение HP ProLiant G7 (iLO 3) не поддържат новите SSL/TLS стандарти за ренегоциация, интеграцията не може да се свърже с тях директно.
Как работи:
Аддонът изолира остарелите протоколи в защитен Docker контейнер, управляван от Nginx. Той приема съвременни и сигурни HTTPS заявки от Home Assistant на порт 7195, превежда ги в движение и ги изпраща към физическото iLO 3 по чист HTTP протокол на порт 80. По този начин се заобикалят всички SSL грешки, а интеграцията получава чист и надежден достъп до всички хардуерни сензори (температури, вентилатори, захранвания) и бутони за управление.

How It Works:
The add-on isolates the outdated protocols inside a secure Docker container managed by Nginx. It accepts modern, secure HTTPS requests from Home Assistant on port 7195, rewires them on the fly, and forwards them to the physical iLO 3 via clean HTTP on port 80. This completely bypasses all upstream SSL handshake failures, allowing the integration to successfully discover and read all hardware sensors (temperatures, fans, power supplies) and execute power control commands.
Как работи:
Аддонът изолира остарелите протоколи в защитен Docker контейнер, управляван от Nginx. Той приема съвременни и сигурни HTTPS заявки от Home Assistant на порт 7195, превежда ги в движение и ги изпраща към физическото iLO 3 по чист HTTP протокол на порт 80. По този начин се заобикалят всички SSL грешки, а интеграцията получава чист и надежден достъп до всички хардуерни сензори (температури, вентилатори, захранвания) и бутони за управление.
