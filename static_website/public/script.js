const path = "/server/";

function createPromise(method, url, body) {
    return new Promise(function (resolve, reject) {

        let req = new XMLHttpRequest();

        req.open(method, url);
        req.send(body);
        req.onload = function () {
            if (req.status === 200) {
                resolve(req.response);
            } else {
                reject(Error(req.statusText));
            }
        };

        req.onerror = function () {
            reject(Error("Network Error"))
        };

    })

}

function getAllAccounts() {
    createPromise("GET", path + "/getAllAccounts").then(resolve => { console.log(resolve) });
}

function createAccount() {

    let account = {
        firstName: document.getElementById('creFirst').value,
        lastName: document.getElementById('creLast').value,
    };

    createPromise("POST", path + "addAccount", JSON.stringify(account)).then(resolve => { console.log(resolve) });
}
