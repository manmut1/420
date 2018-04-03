---


---

<h1 id="modul-300---dokumentation">Modul 300 - Dokumentation</h1>
<h3 id="marvin-schuster">Marvin Schuster</h3>
<p>Im Modul 300 wurde uns die Arbeit mit Containers und Virtuellen Maschienen näher gebracht.</p>
<h2 id="auftrag">Auftrag</h2>
<p>Der Auftrag handelte über das erstellen und einbinden von Virtuellen Maschinen. Dies sollte über GitBash und ein Vagrant File geschehen. Mit dieser Methode sollen besonders in Firmen viel Zeit eingespart werden, da man die Server und darauf benötigten Dienste direkt und mit sehr kleinem Aufwand installieren kann.</p>
<h2 id="bewertung">Bewertung</h2>
<p>• Umgebung (Multi VM) funktionsfähig auf eigenem Notebook (Note 4.0)</p>
<p>• Bestehende VM aus Vagrant Cloud zum laufen bringen (Note 4.5)</p>
<p>• Eigener Service auf Basis IaC implementieren (Note 5.0 – 5.5)</p>
<p>• Projekt auf github Ablegen und Dokumentieren (Markdown) (Note 5.5 – 6.0)</p>
<h2 id="vorgehen">Vorgehen</h2>
<p>Wir arbeiteten nach dem IPERKA system. Wir schauten uns den Auftrag genau an und informierten uns. Anschliessen planten wir unser Vorgehen. Die Vorgehensweise wurde vom Auftragsdokument übernommen, da dort alles genau beschrieben wurde. Wir arbeiteten somit das Skript durch. Wir hatten Startprobleme, da es bei Ramon nicht geklappt hat Vagrant aufzusetzen. Wir lösten dieses Problem am zweiten Modultag, indem wir alles nochmals neu installierten. Nachdem folgte die Arbeit am Skript. Leider verstanden wir nicht ganz alles, was uns zu einem unseren Mitstiften führte, mit welchem wir ein Vagrant-File erstellten.</p>
<p>So wie in vielen Modulen zuvor gelernt, wendete ich IPERKA an. Bedeutet also, ich informierte mich zuerst über den Auftrag, bevor ich mir überlegte, wie das ganze zu lösen ist. Ebenfalls benutzte ich natürlich das Script, welches uns zur Verfügung stand.</p>
<h2 id="github">GITHUB</h2>
<p>Wir haben uns Konten bei GITHUB erstellt. GITHUB bietet die Möglichkeit Dateien auf einfachem Wege hochzuladen, leicht bearbeitbar und offen zugänglich zu machen.</p>
<p>Mit Github ist es möglich den Kontakt zu anderen Entwickler auf der ganzen welt zu aufzubauen. Genau auf diesem Wege werden wir auch unsere fertigen Vagrantfiles mit unserem Lehrer kommunizieren.</p>
<blockquote>
<p>“GitHub brings together the world’s largest community of developers to discover, share, and build better software.”</p>
</blockquote>
<h2 id="produktive-nutzung">Produktive Nutzung</h2>
<p>Unsere Umgebung ist darauf aufgebaut, dass man mit wenigen Commands eine ganze VM Umgebung aufsetzen kann, die sich automatisch installiert und Konfiguriert.</p>
<p>Bsp. kann ein Informatiker, der mehrere VMs pro Tag aufsetzten muss sich sehr viel Arbeit, Zeit und Nerven sparen.</p>
<p>So kann er mit Git Bash in ein Verzeichnis gehen, wo sich ein Vagrant-File befindet. In diesem Verzeichnis kann er ganz einfach den command “vagrant up” ausführen und das Vagrant-File wird ausgeführt.</p>
<p>In diesem Vagrant-File ist definiert von wo er sich das OS grabben soll, welche konfigurationen er vornehemen soll und wie ist installiert wird.</p>
<h2 id="eigener-service">Eigener Service</h2>
<p>Wir haben bei dem Auftrag des eigenen Services zuerst darauf geschaut, dass wir das Vagrantfile überhaupt verstehen. Durch logisches überlegen, konnten wir anpassungen in diesem File vornehmen.<br>
Sie sehen gleich ein Vagrant-File bei dem Ubuntu mit einer Firewall Reproxy installiert wird. die Ports haben wir so abgeändert, dass jegliche kommunikation von der IP 10.0.2.2 zugelassen wird.<br>
Ausserdem das Protokoll TCP über den Port 80 in jedem Fall zugelassen.<br>
Um sicherzugehen, dass diese Commands auch ausgeführt werden, führen wir den Command Force ein.</p>
<pre><code>Vagrant.configure do |config|   config.vm.box = "ubuntu/trusty64"   config.vm.network "private_network", ip:"192.168.56.1"   config.vm.network "forwarded_port", guest:80, host:8080, auto_correct: true   config.vm.synced_folder ".", "/var/www/html"  config.vm.provider "virtualbox" do |vb|   vb.memory = "512"  end   config.vm.provision "shell", inline: &lt;&lt;-SHELL
    sudo apt-get update
    sudo apt-get install apache2 -y
    sudo apt-get install ufw -y
    sudo ufw allow from 10.0.2.2 to any port 22
    sudo ufw allow 80/tcp
    sudo ufw --force enable
    sudo apt-get install libapache2-mod-proxy-html -y
    sudo apt-get install libxml2-dev -y
    a2enmod proxy
    a2enmod proxy_html
    a2enmod proxy_http/41
    sed -i '$aServerName localhost' /etc/apache2/apache2.conf
    service apache2 restart
    cd /etc/apache2/sites-enabled
    wget https://pastebin.com/raw/GbjFC2ii
    cp GbjFC2ii 001-reverseproxy.conf   SHELL end
</code></pre>
<h2 id="test">Test</h2>
<h2 id="bewertung-1">Bewertung</h2>
<p>• Umgebung (Multi VM) funktionsfähig auf eigenem Notebook (Note 4.0)</p>
<p>• Bestehende VM aus Vagrant Cloud zum laufen bringen (Note 4.5)</p>
<p>• Eigener Service auf Basis IaC implementieren (Note 5.0 – 5.5)</p>
<p>• Projekt auf github Ablegen und Dokumentieren (Markdown) (Note 5.5 – 6.0)</p>
<h2 id="vorgehen-1">Vorgehen</h2>
<p>Wir arbeiteten nach dem IPERKA system. Wir schauten uns den Auftrag genau an und informierten uns. Anschliessen planten wir unser Vorgehen. Die Vorgehensweise wurde vom Auftragsdokument übernommen, da dort alles genau beschrieben wurde. Wir arbeiteten somit das Skript durch. Wir hatten Startprobleme, da es bei Ramon nicht geklappt hat Vagrant aufzusetzen. Wir lösten dieses Problem am zweiten Modultag, indem wir alles nochmals neu installierten. Nachdem folgte die Arbeit am Skript. Leider verstanden wir nicht ganz alles, was uns zu einem unseren Mitstiften führte, mit welchem wir ein Vagrant-File erstellten.</p>
<h2 id="github-1">GITHUB</h2>
<p>Wir haben uns Konten bei GITHUB erstellt. GITHUB bietet die Möglichkeit Dateien auf einfachem Wege hochzuladen, leicht bearbeitbar und offen zugänglich zu machen.</p>
<p>Mit Github ist es möglich den Kontakt zu anderen Entwickler auf der ganzen welt zu aufzubauen. Genau auf diesem Wege werden wir auch unsere fertigen Vagrantfiles mit unserem Lehrer kommunizieren.</p>
<blockquote>
<p>“GitHub brings together the world’s largest community of developers to discover, share, and build better software.”</p>
</blockquote>
<h2 id="produktive-nutzung-1">Produktive Nutzung</h2>
<p>Unsere Umgebung ist darauf aufgebaut, dass man mit wenigen Commands eine ganze VM Umgebung aufsetzen kann, die sich automatisch installiert und Konfiguriert.</p>
<p>Bsp. kann ein Informatiker, der mehrere VMs pro Tag aufsetzten muss sich sehr viel Arbeit, Zeit und Nerven sparen.</p>
<p>So kann er mit Git Bash in ein Verzeichnis gehen, wo sich ein Vagrant-File befindet. In diesem Verzeichnis kann er ganz einfach den command “vagrant up” ausführen und das Vagrant-File wird ausgeführt.</p>
<p>In diesem Vagrant-File ist definiert von wo er sich das OS grabben soll, welche konfigurationen er vornehemen soll und wie ist installiert wird.</p>
<h2 id="eigener-service-1">Eigener Service</h2>
<p>Wir haben bei dem Auftrag des eigenen Services zuerst darauf geschaut, dass wir das Vagrantfile überhaupt verstehen. Durch logisches überlegen, konnten wir anpassungen in diesem File vornehmen.<br>
Sie sehen gleich ein Vagrant-File bei dem Ubuntu mit einer Firewall Reproxy installiert wird. die Ports haben wir so abgeändert, dass jegliche kommunikation von der IP 10.0.2.2 zugelassen wird.<br>
Ausserdem das Protokoll TCP über den Port 80 in jedem Fall zugelassen.<br>
Um sicherzugehen, dass diese Commands auch ausgeführt werden, führen wir den Command Force ein.</p>
<pre><code>Vagrant.configure do |config|   config.vm.box = "ubuntu/trusty64"   config.vm.network "private_network", ip:"192.168.56.1"   config.vm.network "forwarded_port", guest:80, host:8080, auto_correct: true   config.vm.synced_folder ".", "/var/www/html"  config.vm.provider "virtualbox" do |vb|   vb.memory = "512"  end   config.vm.provision "shell", inline: &lt;&lt;-SHELL
    sudo apt-get update
    sudo apt-get install apache2 -y
    sudo apt-get install ufw -y
    sudo ufw allow from 10.0.2.2 to any port 22
    sudo ufw allow 80/tcp
    sudo ufw --force enable
    sudo apt-get install libapache2-mod-proxy-html -y
    sudo apt-get install libxml2-dev -y
    a2enmod proxy
    a2enmod proxy_html
    a2enmod proxy_http/41
    sed -i '$aServerName localhost' /etc/apache2/apache2.conf
    service apache2 restart
    cd /etc/apache2/sites-enabled
    wget https://pastebin.com/raw/GbjFC2ii
    cp GbjFC2ii 001-reverseproxy.conf   SHELL end
</code></pre>
<h2 id="test-1">Test</h2>

<table>
<thead>
<tr>
<th></th>
<th>ASCII</th>
<th>HTML</th>
</tr>
</thead>
<tbody>
<tr>
<td>Single backticks</td>
<td><code>'Isn't this fun?'</code></td>
<td>‘Isn’t this fun?’</td>
</tr>
<tr>
<td>Quotes</td>
<td><code>"Isn't this fun?"</code></td>
<td>“Isn’t this fun?”</td>
</tr>
<tr>
<td>Dashes</td>
<td><code>-- is en-dash, --- is em-dash</code></td>
<td>– is en-dash, — is em-dash</td>
</tr>
</tbody>
</table><h2 id="katex">KaTeX</h2>
<p>You can render LaTeX mathematical expressions using <a href="https://khan.github.io/KaTeX/">KaTeX</a>:</p>
<p>The <em>Gamma function</em> satisfying <span class="katex--inline"><span class="katex"><span class="katex-mathml"><math><semantics><mrow><mi mathvariant="normal">Γ</mi><mo>(</mo><mi>n</mi><mo>)</mo><mo>=</mo><mo>(</mo><mi>n</mi><mo>−</mo><mn>1</mn><mo>)</mo><mo>!</mo><mspace width="1em"></mspace><mi mathvariant="normal">∀</mi><mi>n</mi><mo>∈</mo><mi mathvariant="double-struck">N</mi></mrow><annotation encoding="application/x-tex">\Gamma(n) = (n-1)!\quad\forall n\in\mathbb N</annotation></semantics></math></span><span class="katex-html" aria-hidden="true"><span class="strut" style="height: 0.75em;"></span><span class="strut bottom" style="height: 1em; vertical-align: -0.25em;"></span><span class="base"><span class="mord mathrm">Γ</span><span class="mopen">(</span><span class="mord mathit">n</span><span class="mclose">)</span><span class="mrel">=</span><span class="mopen">(</span><span class="mord mathit">n</span><span class="mbin">−</span><span class="mord mathrm">1</span><span class="mclose">)</span><span class="mclose">!</span><span class="mord mathrm"><span class="mspace quad"></span><span class="mord mathrm">∀</span></span><span class="mord mathit">n</span><span class="mrel">∈</span><span class="mord mathbb">N</span></span></span></span></span> is via the Euler integral</p>
<p><span class="katex--display"><span class="katex-display"><span class="katex"><span class="katex-mathml"><math><semantics><mrow><mi mathvariant="normal">Γ</mi><mo>(</mo><mi>z</mi><mo>)</mo><mo>=</mo><msubsup><mo>∫</mo><mn>0</mn><mi mathvariant="normal">∞</mi></msubsup><msup><mi>t</mi><mrow><mi>z</mi><mo>−</mo><mn>1</mn></mrow></msup><msup><mi>e</mi><mrow><mo>−</mo><mi>t</mi></mrow></msup><mi>d</mi><mi>t</mi><mspace width="0.16667em"></mspace><mi mathvariant="normal">.</mi></mrow><annotation encoding="application/x-tex">
\Gamma(z) = \int_0^\infty t^{z-1}e^{-t}dt\,.
</annotation></semantics></math></span><span class="katex-html" aria-hidden="true"><span class="strut" style="height: 1.41429em;"></span><span class="strut bottom" style="height: 2.32624em; vertical-align: -0.91195em;"></span><span class="base"><span class="mord mathrm">Γ</span><span class="mopen">(</span><span class="mord mathit" style="margin-right: 0.04398em;">z</span><span class="mclose">)</span><span class="mrel">=</span><span class="mop"><span class="mop op-symbol large-op" style="margin-right: 0.44445em; position: relative; top: -0.001125em;">∫</span><span class="msupsub"><span class="vlist-t vlist-t2"><span class="vlist-r"><span class="vlist" style="height: 1.41429em;"><span class="" style="top: -1.78805em; margin-left: -0.44445em; margin-right: 0.05em;"><span class="pstrut" style="height: 2.7em;"></span><span class="sizing reset-size6 size3 mtight"><span class="mord mathrm mtight">0</span></span></span><span class="" style="top: -3.8129em; margin-right: 0.05em;"><span class="pstrut" style="height: 2.7em;"></span><span class="sizing reset-size6 size3 mtight"><span class="mord mathrm mtight">∞</span></span></span></span><span class="vlist-s">​</span></span><span class="vlist-r"><span class="vlist" style="height: 0.91195em;"></span></span></span></span></span><span class="mord"><span class="mord mathit">t</span><span class="msupsub"><span class="vlist-t"><span class="vlist-r"><span class="vlist" style="height: 0.864108em;"><span class="" style="top: -3.113em; margin-right: 0.05em;"><span class="pstrut" style="height: 2.7em;"></span><span class="sizing reset-size6 size3 mtight"><span class="mord mtight"><span class="mord mathit mtight" style="margin-right: 0.04398em;">z</span><span class="mbin mtight">−</span><span class="mord mathrm mtight">1</span></span></span></span></span></span></span></span></span><span class="mord"><span class="mord mathit">e</span><span class="msupsub"><span class="vlist-t"><span class="vlist-r"><span class="vlist" style="height: 0.843556em;"><span class="" style="top: -3.113em; margin-right: 0.05em;"><span class="pstrut" style="height: 2.7em;"></span><span class="sizing reset-size6 size3 mtight"><span class="mord mtight"><span class="mord mtight">−</span><span class="mord mathit mtight">t</span></span></span></span></span></span></span></span></span><span class="mord mathit">d</span><span class="mord mathit">t</span><span class="mord mathrm"><span class="mspace thinspace"></span><span class="mord mathrm">.</span></span></span></span></span></span></span></p>
<blockquote>
<p>You can find more information about <strong>LaTeX</strong> mathematical expressions <a href="http://meta.math.stackexchange.com/questions/5020/mathjax-basic-tutorial-and-quick-reference">here</a>.</p>
</blockquote>
<h2 id="uml-diagrams">UML diagrams</h2>
<p>You can render UML diagrams using <a href="https://mermaidjs.github.io/">Mermaid</a>. For example, this will produce a sequence diagram:</p>
<div class="mermaid"><svg xmlns="http://www.w3.org/2000/svg" id="mermaid-svg-nZea7cXMqTkbFtQL" height="100%" width="100%" style="max-width:750px;" viewBox="-50 -10 750 484"><g></g><g><line id="actor12" x1="75" y1="5" x2="75" y2="473" class="actor-line" stroke-width="0.5px" stroke="#999"></line><rect x="0" y="0" fill="#eaeaea" stroke="#666" width="150" height="65" rx="3" ry="3" class="actor"></rect><text x="75" y="32.5" dominant-baseline="central" alignment-baseline="central" class="actor" style="text-anchor: middle;"><tspan x="75" dy="0">Alice</tspan></text></g><g><line id="actor13" x1="275" y1="5" x2="275" y2="473" class="actor-line" stroke-width="0.5px" stroke="#999"></line><rect x="200" y="0" fill="#eaeaea" stroke="#666" width="150" height="65" rx="3" ry="3" class="actor"></rect><text x="275" y="32.5" dominant-baseline="central" alignment-baseline="central" class="actor" style="text-anchor: middle;"><tspan x="275" dy="0">Bob</tspan></text></g><g><line id="actor14" x1="475" y1="5" x2="475" y2="473" class="actor-line" stroke-width="0.5px" stroke="#999"></line><rect x="400" y="0" fill="#eaeaea" stroke="#666" width="150" height="65" rx="3" ry="3" class="actor"></rect><text x="475" y="32.5" dominant-baseline="central" alignment-baseline="central" class="actor" style="text-anchor: middle;"><tspan x="475" dy="0">John</tspan></text></g><defs><marker id="arrowhead" refX="5" refY="2" markerWidth="6" markerHeight="4" orient="auto"><path d="M 0,0 V 4 L6,2 Z"></path></marker></defs><defs><marker id="crosshead" markerWidth="15" markerHeight="8" orient="auto" refX="16" refY="4"><path fill="black" stroke="#000000" stroke-width="1px" d="M 9,2 V 6 L16,4 Z" style="stroke-dasharray: 0, 0;"></path><path fill="none" stroke="#000000" stroke-width="1px" d="M 0,1 L 6,7 M 6,1 L 0,7" style="stroke-dasharray: 0, 0;"></path></marker></defs><g><text x="175" y="93" class="messageText" style="text-anchor: middle;">Hello Bob, how are you?</text><line x1="75" y1="100" x2="275" y2="100" class="messageLine0" stroke-width="2" stroke="black" marker-end="url(#arrowhead)" style="fill: none;"></line></g><g><text x="375" y="128" class="messageText" style="text-anchor: middle;">How about you John?</text><line x1="275" y1="135" x2="475" y2="135" class="messageLine1" stroke-width="2" stroke="black" marker-end="url(#arrowhead)" style="stroke-dasharray: 3, 3; fill: none;"></line></g><g><text x="175" y="163" class="messageText" style="text-anchor: middle;">I am good thanks!</text><line x1="275" y1="170" x2="75" y2="170" class="messageLine1" stroke-width="2" stroke="black" marker-end="url(#crosshead)" style="stroke-dasharray: 3, 3; fill: none;"></line></g><g><text x="375" y="198" class="messageText" style="text-anchor: middle;">I am good thanks!</text><line x1="275" y1="205" x2="475" y2="205" class="messageLine0" stroke-width="2" stroke="black" marker-end="url(#crosshead)" style="fill: none;"></line></g><g><rect x="500" y="215" fill="#EDF2AE" stroke="#666" width="150" height="103" rx="0" ry="0" class="note"></rect><text x="516" y="245" fill="black" class="noteText"><tspan x="516">Bob thinks a long</tspan><tspan dy="23" x="516">long time, so long</tspan><tspan dy="23" x="516">that the text does</tspan><tspan dy="23" x="516">not fit on a row.</tspan></text></g><g><text x="175" y="346" class="messageText" style="text-anchor: middle;">Checking with John...</text><line x1="275" y1="353" x2="75" y2="353" class="messageLine1" stroke-width="2" stroke="black" style="stroke-dasharray: 3, 3; fill: none;"></line></g><g><text x="275" y="381" class="messageText" style="text-anchor: middle;">Yes... John, how are you?</text><line x1="75" y1="388" x2="475" y2="388" class="messageLine0" stroke-width="2" stroke="black" style="fill: none;"></line></g><g><rect x="0" y="408" fill="#eaeaea" stroke="#666" width="150" height="65" rx="3" ry="3" class="actor"></rect><text x="75" y="440.5" dominant-baseline="central" alignment-baseline="central" class="actor" style="text-anchor: middle;"><tspan x="75" dy="0">Alice</tspan></text></g><g><rect x="200" y="408" fill="#eaeaea" stroke="#666" width="150" height="65" rx="3" ry="3" class="actor"></rect><text x="275" y="440.5" dominant-baseline="central" alignment-baseline="central" class="actor" style="text-anchor: middle;"><tspan x="275" dy="0">Bob</tspan></text></g><g><rect x="400" y="408" fill="#eaeaea" stroke="#666" width="150" height="65" rx="3" ry="3" class="actor"></rect><text x="475" y="440.5" dominant-baseline="central" alignment-baseline="central" class="actor" style="text-anchor: middle;"><tspan x="475" dy="0">John</tspan></text></g></svg></div>
<p>And this will produce a flow chart:</p>
<div class="mermaid"><svg xmlns="http://www.w3.org/2000/svg" id="mermaid-svg-89YJBmcRt3ebrrQU" height="100%" viewBox="0 0 531.1218719482422 215.890625" style="max-width:531.1218719482422px;"><g><g class="output"><g class="clusters"></g><g class="edgePaths"><g class="edgePath" style="opacity: 1;"><path class="path" d="M119.91170576572816,78.41796875L179.3203125,49.9453125L255.2578125,49.9453125" marker-end="url(#arrowhead87)" style="fill:none"></path><defs><marker id="arrowhead87" viewBox="0 0 10 10" refX="9" refY="5" markerUnits="strokeWidth" markerWidth="8" markerHeight="6" orient="auto"><path d="M 0 0 L 10 5 L 0 10 z" class="arrowheadPath" style="stroke-width: 1; stroke-dasharray: 1, 0;"></path></marker></defs></g><g class="edgePath" style="opacity: 1;"><path class="path" d="M119.91170576572816,124.41796875L179.3203125,152.890625L234.796875,152.890625" marker-end="url(#arrowhead88)" style="fill:none"></path><defs><marker id="arrowhead88" viewBox="0 0 10 10" refX="9" refY="5" markerUnits="strokeWidth" markerWidth="8" markerHeight="6" orient="auto"><path d="M 0 0 L 10 5 L 0 10 z" class="arrowheadPath" style="stroke-width: 1; stroke-dasharray: 1, 0;"></path></marker></defs></g><g class="edgePath" style="opacity: 1;"><path class="path" d="M315.1484375,49.9453125L360.609375,49.9453125L407.12250953976667,80.90483573611228" marker-end="url(#arrowhead89)" style="fill:none"></path><defs><marker id="arrowhead89" viewBox="0 0 10 10" refX="9" refY="5" markerUnits="strokeWidth" markerWidth="8" markerHeight="6" orient="auto"><path d="M 0 0 L 10 5 L 0 10 z" class="arrowheadPath" style="stroke-width: 1; stroke-dasharray: 1, 0;"></path></marker></defs></g><g class="edgePath" style="opacity: 1;"><path class="path" d="M335.609375,152.890625L360.609375,152.890625L407.12250770354245,122.93110297942131" marker-end="url(#arrowhead90)" style="fill:none"></path><defs><marker id="arrowhead90" viewBox="0 0 10 10" refX="9" refY="5" markerUnits="strokeWidth" markerWidth="8" markerHeight="6" orient="auto"><path d="M 0 0 L 10 5 L 0 10 z" class="arrowheadPath" style="stroke-width: 1; stroke-dasharray: 1, 0;"></path></marker></defs></g></g><g class="edgeLabels"><g class="edgeLabel" transform="translate(179.3203125,49.9453125)" style="opacity: 1;"><g transform="translate(-30.4765625,-13)" class="label"><foreignObject width="60.953125" height="26"><div xmlns="http://www.w3.org/1999/xhtml" style="display: inline-block; white-space: nowrap;"><span class="edgeLabel">Link text</span></div></foreignObject></g></g><g class="edgeLabel" transform="" style="opacity: 1;"><g transform="translate(0,0)" class="label"><foreignObject width="0" height="0"><div xmlns="http://www.w3.org/1999/xhtml" style="display: inline-block; white-space: nowrap;"><span class="edgeLabel"></span></div></foreignObject></g></g><g class="edgeLabel" transform="" style="opacity: 1;"><g transform="translate(0,0)" class="label"><foreignObject width="0" height="0"><div xmlns="http://www.w3.org/1999/xhtml" style="display: inline-block; white-space: nowrap;"><span class="edgeLabel"></span></div></foreignObject></g></g><g class="edgeLabel" transform="" style="opacity: 1;"><g transform="translate(0,0)" class="label"><foreignObject width="0" height="0"><div xmlns="http://www.w3.org/1999/xhtml" style="display: inline-block; white-space: nowrap;"><span class="edgeLabel"></span></div></foreignObject></g></g></g><g class="nodes"><g class="node" id="A" transform="translate(71.921875,101.41796875)" style="opacity: 1;"><rect rx="0" ry="0" x="-51.921875" y="-23" width="103.84375" height="46"></rect><g class="label" transform="translate(0,0)"><g transform="translate(-41.921875,-13)"><foreignObject width="83.84375" height="26"><div xmlns="http://www.w3.org/1999/xhtml" style="display: inline-block; white-space: nowrap;">Square Rect</div></foreignObject></g></g></g><g class="node" id="B" transform="translate(285.203125,49.9453125)" style="opacity: 1;"><circle x="-29.9453125" y="-23" r="29.9453125"></circle><g class="label" transform="translate(0,0)"><g transform="translate(-19.9453125,-13)"><foreignObject width="39.890625" height="26"><div xmlns="http://www.w3.org/1999/xhtml" style="display: inline-block; white-space: nowrap;">Circle</div></foreignObject></g></g></g><g class="node" id="C" transform="translate(285.203125,152.890625)" style="opacity: 1;"><rect rx="5" ry="5" x="-50.40625" y="-23" width="100.8125" height="46"></rect><g class="label" transform="translate(0,0)"><g transform="translate(-40.40625,-13)"><foreignObject width="80.8125" height="26"><div xmlns="http://www.w3.org/1999/xhtml" style="display: inline-block; white-space: nowrap;">Round Rect</div></foreignObject></g></g></g><g class="node" id="D" transform="translate(438.3656234741211,101.41796875)" style="opacity: 1;"><polygon points="52.75625,0 105.5125,-52.75625 52.75625,-105.5125 0,-52.75625" rx="5" ry="5" transform="translate(-52.75625,52.75625)"></polygon><g class="label" transform="translate(0,0)"><g transform="translate(-32.9453125,-13)"><foreignObject width="65.890625" height="26"><div xmlns="http://www.w3.org/1999/xhtml" style="display: inline-block; white-space: nowrap;">Rhombus</div></foreignObject></g></g></g></g></g></g></svg></div>

