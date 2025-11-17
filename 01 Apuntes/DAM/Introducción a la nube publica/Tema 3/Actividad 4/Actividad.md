---
dg-publish: true
---
1. Configurar la comunicación entre tres VPCs: 
	- VPC-A y VPC-B mediante un Transit Gateway. 
	- VPC-A y VPC-C mediante una VPC Peering Connection. 
2. Tres VPCs en la misma o diferentes regiones: 
- VPC-A: 10.0.0.0/16 • VPC-B: 10.1.0.0/16 • VPC-C: 10.2.0.0/16 Lanza instancias EC2 en cada VPC. Usa ping o telnet para verificar conectividad entre: • EC2 en VPC-A ↔ VPC-B (mediante TGW). • EC2 en VPC-A ↔ VPC-C (mediante Peering).
