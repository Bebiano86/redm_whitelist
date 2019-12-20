# redm_whitelist
whitelist for RedM servers

[---Dependencias---]

 mysql-async

[---Instalação---]
```
1) enviar redm_whitelist para dentro da pasta resources [REDM]

2) Inportar redm_whitelist.sql para a tua base de dados

3) adicionar ao server.cfg (ensure redm_whitelist)
```
[---adicionar jogadores a whitelist---]
```
INSERT INTO whitelist(identifier) VALUES ('O TEU STEAM ID AQUI')
```
[exemplo:] 
```
INSERT INTO whitelist(identifier) VALUES ('steam:110000107b87724')
```
