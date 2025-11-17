---
dg-publish: true
---
1. Configurar la comunicación entre tres VPCs: 
	- VPC-A y VPC-B mediante un Transit Gateway. 
	- VPC-A y VPC-C mediante una VPC Peering Connection. 
			VPC-A
		![[Pasted image 20251117193541.png]]
		![[Pasted image 20251117193606.png]]
			VPC-C:
			![[Pasted image 20251117193833.png]]
2. Tres VPCs en la misma o diferentes regiones: 
	- VPC-A: 10.0.0.0/16 
	- VPC-B: 10.1.0.0/16 
	- VPC-C: 10.2.0.0/16 Lanza instancias EC2 en cada VPC. 
Usa ping o telnet para verificar conectividad entre: 
- EC2 en VPC-A ↔ VPC-B (mediante TGW).
- EC2 en VPC-A ↔ VPC-C (mediante Peering).
![[Pasted image 20251117193421.png]]

