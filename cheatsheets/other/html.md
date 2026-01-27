# HTML

## add image centered

Example taken from proxmox helperscripts

```html
<div align='center'><a href='https://Helper-Scripts.com' target='_blank' rel='noopener noreferrer'><img src='https://raw.githubusercontent.com/tteck/Proxmox/main/misc/images/logo-81x112.png'/></a>

  # Nginx Proxy Manager LXC

  <a href='https://ko-fi.com/proxmoxhelperscripts'><img src='https://img.shields.io/badge/&#x2615;-Buy me a coffee-blue' /></a>
  </div>
```

## Center the image with markdown

HTML attributes with Markdown

You add extra brackets to the Markdown, and it will be transformed into attributes :

```html
![Picture](Picture.svg){ width="800" height="600" style="display: block; margin: 0 auto" }
```

Could be rendered like this :

```html
<img src="Picture.svg"
        alt="Picture"
        width="800"
        height="600"
        style="display: block; margin: 0 auto" />
```