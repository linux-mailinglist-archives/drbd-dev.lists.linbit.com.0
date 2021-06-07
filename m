Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C3339D5AB
	for <lists+drbd-dev@lfdr.de>; Mon,  7 Jun 2021 09:13:50 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 97D174205DC;
	Mon,  7 Jun 2021 09:13:48 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C056F4203CF
	for <drbd-dev@lists.linbit.com>; Mon,  7 Jun 2021 09:13:46 +0200 (CEST)
Received: by mail-wm1-f42.google.com with SMTP id
	h22-20020a05600c3516b02901a826f84095so4430505wmq.5
	for <drbd-dev@lists.linbit.com>; Mon, 07 Jun 2021 00:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=eU2nDeCcyFJPZJx4J3tNNqgYyy7YRQ+DoShhLK0wB3o=;
	b=ktlHDYlQmAZQaBWUd38r6hFz5vMT/ZHjwW7SBUi/0Weh3mgbcfoXaNutzG/+tQTST2
	Z1OykRM4XPzsDpWphjTBRnU8N0pSI2wURAEKQQ7BYJ75OGfx3si60SScKt0dUFy1EvKQ
	SxnY5845+nLOpAO/NXysbmrmr/eFgLoZKBQiDiETs+WQXWMEjGz4RQlrPzTfbrWpzdKh
	Oq3Plj4LZ57AGZcDbEYb74EKHr+5FCSTG+PS6tm5GWQQACOaIsdvKvggXHg53BcNJFZD
	vnCz+FBD6ThmlR3gVrWds+wEiiqg2V/QVoIuAZAPGhsz92ESFmKFr7B0rwRV30FLb0jn
	zDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=eU2nDeCcyFJPZJx4J3tNNqgYyy7YRQ+DoShhLK0wB3o=;
	b=FusbuFz5uPl5CB0hFE1C83Y42Kol/N5eLmPh0d8sTc8uWDRetpN/zqwykwGb8cajoM
	JCPksy9wVPN8eOyfBQuc98JJjMAg0t8kb5IKSLy2IOiZpkAWHVjQJ9aAFFYche6WY8e/
	c2MpUyUgfw5op2TNWSNhMJ4TzUebZ+9AhUMYS7iY3/iZvlZkT4ZPnsDtRR4sOl/sH+ZY
	8LPlpTEU6GihiY7EgnIVFEPEGuPZL2hY3GxTBXQI90ZE8CKHZkZ2oOEZZVBSN94Umcs6
	TRMCczLrsvGdJp0WDNProfZFo3sXf7qvskks0VlbNH0mOdCHHlmwgxsHEvVfuoEkS7u6
	beGg==
X-Gm-Message-State: AOAM533LPCikyN4mfWvUWvaeo0P9KO9zuf9alQIy4ftE5fVxcfFtWUYu
	AbubJgYgBvdP82+1nFeZiQhtQ3dA5m3w7N5V1XA=
X-Google-Smtp-Source: ABdhPJzY7+UpEYaKsJcaIgMx/DdRGfGP3mIg43s/K182pR+6dUjuIREeRJT9A9bdfxOy4Kz6WQgqmw==
X-Received: by 2002:a7b:c10b:: with SMTP id w11mr15426466wmi.186.1623050025885;
	Mon, 07 Jun 2021 00:13:45 -0700 (PDT)
Received: from localhost (static.20.139.203.116.clients.your-server.de.
	[116.203.139.20]) by smtp.gmail.com with ESMTPSA id
	o9sm12624088wri.68.2021.06.07.00.13.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 07 Jun 2021 00:13:45 -0700 (PDT)
Date: Mon, 7 Jun 2021 09:13:44 +0200
From: Roland Kammerer <roland.kammerer@linbit.com>
To: drbd-dev@lists.linbit.com
Message-ID: <20210607071344.GG1398@rck.sh>
References: <20210528012244.46041-1-fan.chen@easystack.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210528012244.46041-1-fan.chen@easystack.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Drbd-dev] [PATCH 1/1] Fix the wrong maxinum of ping timeout in
 documentation
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <https://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <https://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

T24gRnJpLCBNYXkgMjgsIDIwMjEgYXQgMDk6MjI6NDRBTSArMDgwMCwgQ2hlbiBGYW4gd3JvdGU6
Cj4gU2lnbmVkLW9mZi1ieTogQ2hlbiBGYW4gPGZhbi5jaGVuQGVhc3lzdGFjay5jbj4KPiBSZXBv
cnRlZC1ieTogbGluZ2FuZy56ZW5nIDxsaW5nZ2FuZy56ZW5nQGVhc3lzdGFjay5jbj4KPiAtLS0K
PiAgZG9jdW1lbnRhdGlvbi9qYS92OS9kcmJkc2V0dXAtb3B0aW9ucy54bWwucG8gfCA0ICsrLS0K
PiAgZG9jdW1lbnRhdGlvbi92OS9kcmJkc2V0dXAtb3B0aW9ucy54bWwgICAgICAgfCAyICstCj4g
IDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kb2N1bWVudGF0aW9uL2phL3Y5L2RyYmRzZXR1cC1vcHRpb25zLnhtbC5wbyBi
L2RvY3VtZW50YXRpb24vamEvdjkvZHJiZHNldHVwLW9wdGlvbnMueG1sLnBvCj4gaW5kZXggNjAx
MDkxM2UuLmM0YWFjZmZmIDEwMDY0NAo+IC0tLSBhL2RvY3VtZW50YXRpb24vamEvdjkvZHJiZHNl
dHVwLW9wdGlvbnMueG1sLnBvCj4gKysrIGIvZG9jdW1lbnRhdGlvbi9qYS92OS9kcmJkc2V0dXAt
b3B0aW9ucy54bWwucG8KPiBAQCAtMTYzMiwxMyArMTYzMiwxMyBAQCBtc2dpZCAiIgo+ICAiPHBs
YWNlaG9sZGVyIHR5cGU9XCJpbmRleHRlcm1cIiBpZD1cIjBcIi8+IERlZmluZSB0aGUgdGltZW91
dCBmb3IgcmVwbGllcyB0byAiCj4gICJrZWVwLWFsaXZlIHBhY2tldHMuICBJZiB0aGUgcGVlciBk
b2VzIG5vdCByZXBseSB3aXRoaW4gPG9wdGlvbj5waW5nLXRpbWVvdXQ8LyIKPiAgIm9wdGlvbj4s
IERSQkQgd2lsbCBjbG9zZSBhbmQgdHJ5IHRvIHJlZXN0YWJsaXNoIHRoZSBjb25uZWN0aW9uLiAg
VGhlIGRlZmF1bHQgIgo+IC0idmFsdWUgaXMgMC41IHNlY29uZHMsIHdpdGggYSBtaW5pbXVtIG9m
IDAuMSBzZWNvbmRzIGFuZCBhIG1heGltdW0gb2YgMyAiCj4gKyJ2YWx1ZSBpcyAwLjUgc2Vjb25k
cywgd2l0aCBhIG1pbmltdW0gb2YgMC4xIHNlY29uZHMgYW5kIGEgbWF4aW11bSBvZiAzMCAiCj4g
ICJzZWNvbmRzLiAgVGhlIHVuaXQgaXMgdGVudGhzIG9mIGEgc2Vjb25kLiIKPiAgbXNnc3RyICIi
Cj4gICI8cGxhY2Vob2xkZXIgdHlwZT1cImluZGV4dGVybVwiIGlkPVwiMFwiLz7jgq3jg7zjg5fj
gqLjg6njgqTjg5bjg5HjgrHjg4Pjg4jjgbjjga7lv5znrZTjga7jgr8iCj4gICLjgqTjg6DjgqLj
gqbjg4jjgpLlrprnvqnjgZnjgovjgILlr77lkJHjg47jg7zjg4njgYwgPG9wdGlvbj5waW5nLXRp
bWVvdXQ8L29wdGlvbj4g6ZaT44Gn5b+c562U44GX44GqIgo+ICAi44GE5aC05ZCI44CBIERSQkQg
44Gv5o6l57aa44KS57WC5LqG44GX44CB5YaN5o6l57aa44GX44KI44GG44Go44GZ44KL44CC44OH
44OV44Kp44Or44OI5YCk44GvIDAuNSDnp5LjgafjgIHmnIAiCj4gLSLlsI/lgKTjga8gMC4xIOen
kuOAgeacgOWkp+WApOOBryAzIOenkuOBp+OBguOCi+OAguWNmOS9jeOBryAxMCDliIbjga4gMSDn
p5LjgafjgYLjgovjgIIiCj4gKyLlsI/lgKTjga8gMC4xIOenkuOAgeacgOWkp+WApOOBryAzMCDn
p5LjgafjgYLjgovjgILljZjkvY3jga8gMTAg5YiG44GuIDEg56eS44Gn44GC44KL44CCIgo+ICAK
PiAgIy4gdHlwZTogQ29udGVudCBvZjogPGRyYmRzZXR1cF9vcHRpb25zPjxkcmJkc2V0dXBfb3B0
aW9uPjx0ZXJtPgo+ICBtc2dpZCAiIgo+IGRpZmYgLS1naXQgYS9kb2N1bWVudGF0aW9uL3Y5L2Ry
YmRzZXR1cC1vcHRpb25zLnhtbCBiL2RvY3VtZW50YXRpb24vdjkvZHJiZHNldHVwLW9wdGlvbnMu
eG1sCj4gaW5kZXggNWI1ZTU4ZDcuLmE4OTkwNzA3IDEwMDY0NAo+IC0tLSBhL2RvY3VtZW50YXRp
b24vdjkvZHJiZHNldHVwLW9wdGlvbnMueG1sCj4gKysrIGIvZG9jdW1lbnRhdGlvbi92OS9kcmJk
c2V0dXAtb3B0aW9ucy54bWwKPiBAQCAtMTE2MSw3ICsxMTYxLDcgQEAgU1lNTElOS19CWV9ESVNL
PWRyYmQvYnktZGlzay88YmFja2luZy1kaXNrLW5hbWU+Cj4gIAk8L2luZGV4dGVybT4gRGVmaW5l
IHRoZSB0aW1lb3V0IGZvciByZXBsaWVzIHRvIGtlZXAtYWxpdmUgcGFja2V0cy4gIElmCj4gIAl0
aGUgcGVlciBkb2VzIG5vdCByZXBseSB3aXRoaW4gPG9wdGlvbj5waW5nLXRpbWVvdXQ8L29wdGlv
bj4sIERSQkQgd2lsbAo+ICAJY2xvc2UgYW5kIHRyeSB0byByZWVzdGFibGlzaCB0aGUgY29ubmVj
dGlvbi4gIFRoZSBkZWZhdWx0IHZhbHVlIGlzIDAuNQo+IC0Jc2Vjb25kcywgd2l0aCBhIG1pbmlt
dW0gb2YgMC4xIHNlY29uZHMgYW5kIGEgbWF4aW11bSBvZiAzIHNlY29uZHMuICBUaGUKPiArCXNl
Y29uZHMsIHdpdGggYSBtaW5pbXVtIG9mIDAuMSBzZWNvbmRzIGFuZCBhIG1heGltdW0gb2YgMzAg
c2Vjb25kcy4gIFRoZQo+ICAJdW5pdCBpcyB0ZW50aHMgb2YgYSBzZWNvbmQuPC9wYXJhPgo+ICAg
ICAgPC9kZWZpbml0aW9uPgo+ICAgIDwvZHJiZHNldHVwX29wdGlvbj4KPiAtLSAKPiAyLjI1LjEK
CkxHVE0sIHRoYW5rcy4gSSB3aWxsIHF1ZXVlIGl0IHVwIGZvciBpbnRlcm5hbCByZXZpZXcgYW5k
IHRoZSBuZXh0CmRyYmQtdXRpbHMgcmVsZWFzZS4KClJlZ2FyZHMsIHJjawpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxpc3QK
ZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1h
bi9saXN0aW5mby9kcmJkLWRldgo=
