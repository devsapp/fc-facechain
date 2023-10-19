const OSS = require('ali-oss');
const path = require('path');


const [bucket, region] = process.env.ENDPOINT.split(".")

const client = new OSS({
  region,
  accessKeyId: process.env.ACCESS_KEY_ID,
  accessKeySecret: process.env.ACCESS_KEY_SECRET,
  bucket,
});

const headers = {
  'x-oss-storage-class': 'Standard',
  'x-oss-object-acl': 'public-read',
  // 'x-oss-forbid-overwrite': 'true',
};

async function put() {
  try {
    const args = process.argv.splice(2);

    const localPath = args[0];
    const remotePath = args[1];

    console.log(`${localPath} => ${remotePath}`);

    const result = await client.put(
      `${remotePath}`,
      path.normalize(localPath),
      { headers ,timeout:6 * 60 * 60 * 1000}
    );
    console.log(`upload success ${result.url}`);
  } catch (e) {
    console.log(e);
  }
}

put();
