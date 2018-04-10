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
<p>So wie in vielen Modulen zuvor gelernt, wendete ich IPERKA an. Bedeutet also, ich informierte mich zuerst über den Auftrag, bevor ich mir überlegte, wie das ganze zu lösen ist. Ebenfalls benutzte ich natürlich das Script, welches uns zur Verfügung stand. Zuerst kam ich nicht richtig nach, da mir einiges noch unklar war. Jedoch konnte ich in solchen Momenten auf meine Klassenkameraden vertrauen, die mir einiges noch erklären durften oder mussten.</p>
<p>Doch nach den weiteren Phasen befand ich mich in einer besseren Situation und konnte immer mehr erreichen, was ich versuchte.</p>
<h2 id="github">GITHUB</h2>
<p>Wir haben uns Konten bei GITHUB erstellt. GITHUB bietet die Möglichkeit Dateien auf einfachem Wege hochzuladen, leicht bearbeitbar und offen zugänglich zu machen.</p>
<p>Mit Github ist es möglich den Kontakt zu anderen Entwickler auf der ganzen welt zu aufzubauen. Genau auf diesem Wege werden wir auch unsere fertigen Vagrantfiles mit unserem Lehrer kommunizieren.</p>
<blockquote>
<p>“GitHub brings together the world’s largest community of developers to discover, share, and build better software.”</p>
</blockquote>
<h2 id="produktive-nutzung">Produktive Nutzung</h2>
<p>Unsere Umgebung ist darauf aufgebaut, dass man mit wenigen Commands eine ganze VM Umgebung aufsetzen kann, die sich automatisch installiert und Konfiguriert.</p>
<p>Bsp. kann ein Informatiker, der mehrere VMs pro Tag aufsetzten muss sich sehr viel Arbeit, Zeit und Nerven sparen. Für den Betrieb ist dies insofern ebenfalls sehr empfehlenswert, da dies natürlich auch Geld spart.</p>
<p>So kann er mit Git Bash in ein Verzeichnis gehen, wo sich ein Vagrant-File befindet. Funktioniert ähnlich wie Linux und sobald man sich im korrekten Verzeichniss befindet, kann mit dem Befehl “Vagrant Up” der Prozess gestartet werden.</p>
<p>In diesem Vagrant-File ist definiert von wo er sich das OS grabben soll, welche konfigurationen er vornehemen soll und wie ist installiert wird.</p>
<h2 id="eigener-service">Eigener Service</h2>
<p>Wir haben bei dem Auftrag des eigenen Services zuerst darauf geschaut, dass wir das Vagrantfile überhaupt verstehen. Durch logisches überlegen, konnten wir anpassungen in diesem File vornehmen.<br>
Ich habe ein Linux System genommen, worauf ich einige Dienste installieren wollte. Das Script sehen Sie unten.<br>
Ausserdem das Protokoll TCP über den Port 80 in jedem Fall zugelassen.<br>
Um sicherzugehen, dass diese Commands auch ausgeführt werden, führen wir den Command Force ein.</p>
<pre><code>web.vm.synced_folder ".", "/vagrant"  	
web.vm.provision "shell", inline: &lt;&lt;-SHELL
#hier werden noch einige Dienste auf dem Server installiert, da der server auch benötigt wird. 
sudo apt-get update

#es wird der Webdienst Apache installiert
sudo apt-get install apache2
	sudo rm /var/www/html/index.html
	sudo touch /var/www/html/index.php
    cat &lt;&lt; EOF &gt; /var/www/html/index.html
    &lt;!doctype html&gt;
    &lt;head&gt;
    &lt;/head&gt;
    &lt;body&gt;
            Hallo auf tieser Seite. 
    &lt;/body&gt;
    &lt;/html&gt;
    SHELL
    end
sudo apt-get install MySQL
sudo apt-get install ufw -y
	sudo ufw allow 10.0.2.2 to any port 22
	sudo ufw allow 80/tcp
	sudo ufw -force enable
	SHELL
	end  
</code></pre>
<h2 id="test">Test</h2>
<p>Als Test-Case habe ich mir einiges herausgenommen, dass ich anschauen wollte. Dies testete ich danach auf Herz und Niere so, dass ich mir wirklich sicher sein konnte.</p>
<p>Aufgeschrieben sieht es folgend aus:<br>
Was wird getestet / was ist zu erwarten /  Test funktioniert</p>
<p><img src="https://perrone.myqnapcloud.com:450/share.cgi/187_Erstellun.PNG?ssid=02YbC2K&amp;fid=02YbC2K&amp;path=%2F&amp;filename=187_Erstellun.PNG&amp;openfolder=normal&amp;ep=" alt=""><br>
Mit Vagrant up die VM aufsetzte, / sollte in Virtual Box angezeigt werden / wurde angezeigt</p>
<p><img src="https://perrone.myqnapcloud.com:450/share.cgi/187_test%20firewall.PNG?ssid=02YbC2K&amp;fid=02YbC2K&amp;path=%2F&amp;filename=187_test%20firewall.PNG&amp;openfolder=normal&amp;ep=" alt=""><br>
Firewall aufgesetzt und gestartet / sollte gestartet sein / ist "active"<br>
<img src="https://perrone.myqnapcloud.com:450/share.cgi/187_Apache.PNG?ssid=02YbC2K&amp;fid=02YbC2K&amp;path=%2F&amp;filename=187_Apache.PNG&amp;openfolder=normal&amp;ep=" alt=""><br>
Apache2 testen / Apache2 läuft / wurde bestätigt.</p>

