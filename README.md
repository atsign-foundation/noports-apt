<!-- pyml disable-num-lines 4 md013,md033-->
<h1><a href="https://atsign.com#gh-light-mode-only">
   <img width=250px src="https://atsign.com/wp-content/uploads/2022/05/atsign-logo-horizontal-color2022.svg#gh-light-mode-only" alt="The Atsign Foundation"></a>
<a href="https://atsign.com#gh-dark-mode-only">
   <img width=250px src="https://atsign.com/wp-content/uploads/2023/08/atsign-logo-horizontal-reverse2022-Color.svg#gh-dark-mode-only" alt="The Atsign Foundation"></a></h1>

# noports-apt

Repo for GitHub Pages hosting .deb packages for
[NoPorts](https://noports.com)

## Installing NoPorts

For Debian and derivatives like Ubuntu...

### Step by step

First add our public key to your keyring:

```sh
sudo mkdir -p /usr/share/keyrings
curl -fsSL https://apt.noports.com/noports.pub.asc | \
  sudo gpg --dearmor -o /usr/share/keyrings/noports-archive-keyring.gpg
```

Then add this repo to apt sources:

<!-- pyml disable-num-lines 2 md013-->
```sh
echo "deb [signed-by=/usr/share/keyrings/noports-archive-keyring.gpg] https://apt.noports.com/ stable main" | \
  sudo tee /etc/apt/sources.list.d/noports.list
```

Then update sources and install NoPorts:

```sh
sudo apt update && sudo apt install -y noports
```

### Or as a one liner

<!-- pyml disable-num-lines 2 md013-->
```sh
sudo mkdir -p /usr/share/keyrings ; curl -fsSL https://apt.noports.com/noports.pub.asc | sudo gpg --dearmor -o /usr/share/keyrings/noports-archive-keyring.gpg ; echo "deb [signed-by=/usr/share/keyrings/noports-archive-keyring.gpg] https://apt.noports.com/ stable main" | sudo tee /etc/apt/sources.list.d/noports.list ; sudo apt update ; sudo apt install -y noports
```
