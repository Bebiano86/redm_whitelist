# redm_whitelist
whitelist for RedM servers

---Dependencias---
mysql-async

---Instalação---

enviar redm_whitelist para dentro da pasta resources [REDM]

Inportar redm_whitelist.sql para a tua base de dados

adicionar ao server.cfg (ensure redm_whitelist)

adicionar jogadores a whitelist

INSERT INTO whitelist(identifier) VALUES ('YOURSTEAMIDHERE')

exemplo: 

INSERT INTO whitelist(identifier) VALUES ('steam:110000107b87724')

