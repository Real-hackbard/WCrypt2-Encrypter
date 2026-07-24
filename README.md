# :computer: WCrypt2 Encrypter

</br>

![Compiler](https://github.com/user-attachments/assets/a916143d-3f1b-4e1f-b1e0-1067ef9e0401) ![10 Seattle](https://github.com/user-attachments/assets/c70b7f21-688a-4239-87c9-9a03a8ff25ab) ![10 1 Berlin](https://github.com/user-attachments/assets/bdcd48fc-9f09-4830-b82e-d38c20492362) ![10 2 Tokyo](https://github.com/user-attachments/assets/5bdb9f86-7f44-4f7e-aed2-dd08de170bd5) ![10 3 Rio](https://github.com/user-attachments/assets/e7d09817-54b6-4d71-a373-22ee179cd49c)   
![10 4 Sydney](https://github.com/user-attachments/assets/e75342ca-1e24-4a7e-8fe3-ce22f307d881) ![11 Alexandria](https://github.com/user-attachments/assets/64f150d0-286a-4edd-acab-9f77f92d68ad) ![12 Athens](https://github.com/user-attachments/assets/59700807-6abf-4e6d-9439-5dc70fc0ceca)  
![Components](https://github.com/user-attachments/assets/d6a7a7a4-f10e-4df1-9c4f-b4a1a8db7f0e) ![None](https://github.com/user-attachments/assets/30ebe930-c928-4aaf-a8e1-5f68ec1ff349)  
![Discription](https://github.com/user-attachments/assets/4a778202-1072-463a-bfa3-842226e300af) ![WCrypt2 File Crypter](https://github.com/user-attachments/assets/9b1777dd-b625-447c-9ec4-cee4566e1931)  
![Last Update](https://github.com/user-attachments/assets/e1d05f21-2a01-4ecf-94f3-b7bdff4d44dd) <img src="https://github.com/user-attachments/assets/54133486-c0fe-4ab2-bbd5-83de334ef2e0" />  
![License](https://github.com/user-attachments/assets/ff71a38b-8813-4a79-8774-09a2f3893b48) ![Freeware](https://github.com/user-attachments/assets/1fea2bbf-b296-4152-badd-e1cdae115c43)

</br>

The ```wcrypt2.pas``` unit provides Delphi header definitions for the classic Microsoft CryptoAPI (CAPI) functions. These interfaces are used to interact with Cryptographic Service Providers (CSPs), manage certificates, and perform cryptographic operations such as signing, encryption, or hashing.

</br>

<img src="https://github.com/user-attachments/assets/a52ce961-6cfb-414c-9feb-6ea2c581e6e0" />

</br>
</br>

This option is intended for applications that are using ephemeral keys, or applications that do not require access to persisted private keys, such as applications that perform only hashing, encryption, and digital signature verification. Only applications that create signatures or decrypt messages need access to a private key. In most cases, this flag should be set.

</br>

```pascal
CryptAcquireContext (@hStore, PWideChar(citac.ReaderId), PWideChar(citac.CardId), PROV_RSA_FULL, CRYPT_VERIFYCONTEXT);//CRYPT_VERIFYCONTEXT) ;
```

</br>

For file-based CSPs, when this flag is set, the pszContainer parameter must be set to NULL. The application has no access to the persisted private keys of public/private key pairs. When this flag is set, temporary public/private key pairs can be created, but they are not persisted.

For hardware-based CSPs, such as a smart card CSP, if the pszContainer parameter is ```NULL``` or blank, this flag implies that no access to any keys is required, and that no UI should be presented to the user. This form is used to connect to the CSP to query its capabilities but not to actually use its keys. If the pszContainer parameter is not ```NULL``` and not blank, then this flag implies that access to only the publicly available information within the specified container is required. The ```CSP``` should not ask for a ```PIN```. Attempts to access private information (for example, the CryptSignHash function) will fail.

When ```CryptAcquireContext``` is called, many CSPs require input from the owning user before granting access to the private keys in the key container. For example, the private keys can be encrypted, requiring a password from the user before they can be used. However, if the ```CRYPT_VERIFYCONTEXT``` flag is specified, access to the private keys is not required and the user interface can be bypassed.


It's operation not a check sign and need private key.

</br>

# CSP (Cryptographic Service Provider)
In the context of Windows-based software development (especially using Delphi or Free Pascal), wcrypt2.pas is a widely recognized Pascal translation header for Microsoft's CryptoAPI (wincrypt.h), which is used to interact directly with a Cryptographic Service Provider (CSP).A CSP is the underlying hardware or software module that executes actual cryptographic operations—such as hashing, encryption, digital signing, and key generation.

### Core Relationship
When you use the wcrypt2 translation unit in Delphi, you invoke standard Windows CryptoAPI functions. These functions must target a CSP to perform any heavy lifting:

* 1.**Initialization:** You use CryptAcquireContext to load a specific CSP into your application memory and acquire a handle to a specific key container.

* 2.**Execution:** Functions like CryptGenKey, CryptEncrypt, or CryptSignHash route your data to the loaded CSP.

* 3.**Hardware vs. Software:** The CSP can either be a standard Microsoft software provider (like the Microsoft Enhanced Cryptographic Provider) or a hardware-bound provider supplied by a vendor (such as a Smart Card reader minidriver or a hardware security module).

### Common CSP Types Used with wcrypt2

</br>

| CSP Constant / Provider Name | Description | Common Use Case |
| :----------- | :----------- | :----------- |
| ```PROV_RSA_FULL```     | RSA software-based provider     | General public/private key encryption and signature tasks.     |
| ```PROV_RSA_AES```     | Enhanced RSA and AES provider     | High-security symmetric AES encryption paired with asymmetric RSA.     |
