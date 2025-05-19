# AWS VPC: Public - Private Architecture Setup

*Author*: Harsh
*Reg No*: 11721210006
*Workshop Task Documentation*

---

## Task 1: Manual Setup via AWS Console

---

### 1. Create a VPC
- *Action*: Created a custom VPC with CIDR 10.0.0.0/16
- *Option Enabled*: DNS hostnames  
*![alt text](Screenshots/1.vpc_with_CIDS.png)*

---

### 2. Create Subnets
- *Public Subnet*: 10.0.1.0/24  
*![alt text](Screenshots/2.1subnet_Public.png)*
- *Private Subnet*: 10.0.2.0/24 
![alt text](Screenshots/2.2subnet_private.png) 
- *Region/Zone*: e.g., ap-south-1  


---

### 3. Create and Attach Internet Gateway (IGW)
- *Step 1*: Created IGW
![alt text](<Screenshots/3.1internet Gateways.png>)  
- *Step 2*: Attached IGW to the VPC
![alt text](<Screenshots/3.2IGW wiith VPC.png>) 


---

### 4. Allocate Elastic IP and Create NAT Gateway
- *Step 1*: Allocated Elastic IP 
![alt text](Screenshots/4.1elastic.png) 
- *Step 2*: Created NAT Gateway in Public Subnet using Elastic IP
![alt text](Screenshots/4.2create_NAT_gateways.png)  
- *Step 3*: Waited until status became "Available"
![alt text](Screenshots/4.3Status_available.png)


---

### 5. Create Route Tables

#### Public Route Table:
- *Step 1*: Created Public RT
![alt text](Screenshots/5.1Public_RT.png) 
- *Step 2*: Route added: 0.0.0.0/0 -> IGW
![alt text](Screenshots/5.2Adding_IGW.png) 
- *Step 3*: Associated with Public Subnet
![alt text](Screenshots/5.3Associate_with_subnetPublic.png) 

#### Private Route Table:
- *Step 1*: Created Private RT
![alt text](Screenshots/5.4Private_RT.png) 
- *Step 2*: Route added: 0.0.0.0/0 -> NAT Gateway
![alt text](Screenshots/5.5adding_NAT.png) 
- *Step 3*: Associated with Private Subnet
![alt text](Screenshots/5.6assosiate_with_subnetprivate.png) 

---

### 6. Configure Security Groups

#### Bastion SG
- *Inbound*: SSH (port 22) from My IP  
- *Outbound*: Allow All  
![alt text](Screenshots/6.1BastionSG.png)

#### Backend EC2 SG
- *Inbound*: SSH (port 22) from 10.0.1.0/24  
- *Outbound*: Allow All  
![alt text](Screenshots/6.2beckendEC2SG.png)
---

### 7. Launch EC2 Instances

#### Bastion Host (Public Subnet)
- *AMI*: Amazon Linux 2  
- *Key Pair*: bastion.pem  
- *Subnet*: Public  
- *SG*: Bastion SG  
![alt text](Screenshots/7.1bostionhost.png)
![alt text](Screenshots/7.2bastion.png)

#### Backend EC2 (Private Subnet)
- *AMI*: Amazon Linux 2 / Ubuntu  
- *Key Pair*: Backend.pem  
- *Subnet*: Private  
- *SG*: Backend SG 
![alt text](Screenshots/7.3backendInstance.png)
![alt text](Screenshots/7.4backendInstance.png)

---

### 8. Validation Screenshots

#### VAlidate Bastion Access
![alt text](Screenshots/8.1connect_bastionSG.png)

#### Validate Backend Access and Internet Access
![alt text](Screenshots/8.2BackendInstace_connected.png)

#### Updating Ubuntu ussing APT Update
![alt text](Screenshots/8.3apt_update.png)