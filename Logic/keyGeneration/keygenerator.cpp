#include "keygenerator.h"


AutoSeededRandomPool rng;
InvertibleRSAFunction params;
string cipher, recovered;

std::string rsaPrivateMaterial;
std::string rsaPublicMaterial;
RSA::PrivateKey rsaPrivate;
RSA::PublicKey rsaPublic;

userKeysStorage storage;
using namespace std;


keyGenerator::keyGenerator(QObject *parent)
    : QObject{parent}
{
    params.GenerateRandomWithKeySize(rng, 3072);

    // rsa generate private key
//    RSA::PrivateKey rsaPrivate(params);
//    StringSink stringSinkPrivate(rsaPrivateMaterial);
//    rsaPrivate.DEREncode(stringSinkPrivate);
//    private_key = QString::fromStdString(rsaPrivateMaterial);
//    qDebug() << "Private key: " << private_key;

//    // rsa generate public key
//    RSA::PublicKey rsaPublic(params);
//    StringSink stringSinkPublic(rsaPublicMaterial);
//    rsaPublic.DEREncode(stringSinkPublic);
//    public_key = QString::fromStdString(rsaPublicMaterial);
//    qDebug() << "Public key: " << public_key;

//    cout << "---------------------------- RSA ----------------------------" << endl;
//    writePrivateKeyInLocalUserFile();
//    writePublicKeyInLocalUserFile();
//    readPrivateKeyInLocalUserFile();
//    readPublicKeyInLocalUserFile();
//    encryptMessage("none");
//    decryptMessage();
//    cout << "---------------------------- AES ----------------------------" << endl;
//    aesEncryption();


    cout << "method was started";

}

// For messages
string keyGenerator::encryptMessage(string data)
{
    RSAES_OAEP_SHA_Encryptor e(readPublicKeyInLocalUserFile());
    StringSource ss1(data, true, new PK_EncryptorFilter(rng, e, new StringSink(cipher)));
    cout << "cipher is" << endl;
    cout << cipher << endl;
    return cipher;
}

void keyGenerator::decryptMessage()
{
    RSAES_OAEP_SHA_Decryptor d(readPrivateKeyInLocalUserFile());
    StringSource ss2(cipher, true, new PK_DecryptorFilter(rng, d, new StringSink(recovered)));
    cout << "recovered is" << endl;
    cout << recovered << endl;
}

// WRITE public/private keys in local user file -->
void keyGenerator::writePublicKeyInLocalUserFile()
{
    // Initialize keys from generated params
    RSA::PublicKey rsaPublic(params);
    FileSink output("rsapublic.dat");
    rsaPublic.DEREncode(output);

    std::string rsaPublicMaterial;
    StringSink stringSink(rsaPublicMaterial);
    rsaPublic.DEREncode(stringSink);

    cout << "Public key was wrote --> " << endl;
    cout << rsaPublicMaterial << endl;

}

void keyGenerator::writePrivateKeyInLocalUserFile()
{
    RSA::PrivateKey rsaPrivate(params);
    FileSink output("rsaprivate.dat");
    rsaPrivate.DEREncode(output);

    std::string rsaPrivateMaterial;
    StringSink stringSink(rsaPrivateMaterial);
    rsaPrivate.DEREncode(stringSink);

    cout << "Private key was wrote --> " << endl;
    cout << rsaPrivateMaterial << endl;
}

// READ public/private keys in local user file -->
RSA::PublicKey keyGenerator::readPublicKeyInLocalUserFile()
{
    RSA::PublicKey publicKey;
    FileSource input("rsapublic.dat", true);
    publicKey.BERDecode(input);
    return publicKey;
}

RSA::PrivateKey keyGenerator::readPrivateKeyInLocalUserFile()
{
    RSA::PrivateKey privateKey;
    FileSource input("rsaprivate.dat", true);
    privateKey.BERDecode(input);
    return privateKey;
}

// AES
void keyGenerator::aesEncryption()
{
    std::string plain = "CBC Mode Test";
    std::string cipher, recovered;
    SecByteBlock key(AES::DEFAULT_KEYLENGTH);
    SecByteBlock iv(AES::BLOCKSIZE);
    EAX< AES >::Encryption e;
    e.SetKeyWithIV(key, key.size(), iv);

    StringSource(plain, true,
        new AuthenticatedEncryptionFilter(e,
            new StringSink(cipher)
        ) // AuthenticatedEncryptionFilter
    ); // StringSource

    EAX< AES >::Decryption d;
    d.SetKeyWithIV(key, key.size(), iv);

    StringSource s(cipher, true,
        new AuthenticatedDecryptionFilter(d,
            new StringSink(recovered)
        ) // AuthenticatedDecryptionFilter
    ); // StringSource

    cout << "cipher: " << endl;
    cout << cipher << endl;
    cout << "recovered: "<< endl;
    cout << recovered << endl;
}


