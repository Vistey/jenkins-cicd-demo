import { Selector } from 'testcafe';

fixture('Getting Started').page('http://192.168.56.102:8080/')

test('My first test', async t => {
    // Test code
    console.log("this is case 1");
    const helloWorld = Selector('#hello-world').exists;
    await t.expect(helloWorld).ok();
});
