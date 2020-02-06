Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2090E180304
	for <lists+drbd-dev@lfdr.de>; Tue, 10 Mar 2020 17:17:54 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E49024203DB;
	Tue, 10 Mar 2020 17:17:52 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A4AD54203E9
	for <drbd-dev@lists.linbit.com>; Thu,  5 Mar 2020 14:13:47 +0100 (CET)
Received: by mail-wm1-f44.google.com with SMTP id g83so5691809wme.1
	for <drbd-dev@lists.linbit.com>; Thu, 05 Mar 2020 05:13:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:mime-version:references:in-reply-to:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=WoPzmJ3QiLukxuz6DKVAzU9gkGfQvjuixc6cO7WUQs8=;
	b=CtXi+ET6Bq6gAWgiXR4Zltdp6IyGxyl9i7RBUlxxXmq/dr0GHXiRSKSuFLx111Cm34
	pAYPyUOvVL1RDisWxcAqeP1S3qF7y8h2UNtxVYYqsY8YTa6CqTErydaXA7cETWmM67bV
	ixCEXD7HSD9mjhZKKSBg3fZ6+2u22DvfDUjj2R+lELc8K3UU3O63DFT1W6v0z0lW3Zsf
	VRk0f77Azx4q+Dyvqpc/oelb8115DlCm2chkxXjJHaEgTJ5x8wzmipZ8JvuyEVUyGRFz
	JYh8X0ph6DsSvkT2uUxDeAPkSBrPzmPGxve+FtVXseU4jijqPsoKxMWQbBHMVA00nbCi
	NNqA==
X-Gm-Message-State: ANhLgQ0ImWhXQigEOlBL82lpczsLHkO6TJTPltWZsmAI9dovmQwYOSTv
	jehpaD5C0mR8yceRe50LvSgGnbtN4dN2wO/d
X-Google-Smtp-Source: ADFU+vtJy9HGlkx2SuTgeUdheXX+AwuUSykzsDDJ3Ex+Tc5bDyz/9honLd62RrEbYk03+pxCqkEozw==
X-Received: by 2002:a1c:9a51:: with SMTP id c78mr9496165wme.130.1583413538956; 
	Thu, 05 Mar 2020 05:05:38 -0800 (PST)
Received: from soda.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219]) by smtp.gmail.com with ESMTPSA id
	f127sm9447622wma.4.2020.03.05.05.05.38
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 05 Mar 2020 05:05:38 -0800 (PST)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Thu, 5 Mar 2020 14:05:37 +0100
Resent-Message-ID: <20200305130537.GF19467@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
Received: by 2002:a05:6838:e22b:0:0:0:0 with SMTP id d11csp867898nkf;
	Wed, 5 Feb 2020 18:01:20 -0800 (PST)
X-Received: by 2002:a05:6808:487:: with SMTP id
	z7mr5504781oid.59.1580954480210; 
	Wed, 05 Feb 2020 18:01:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580954480; cv=none;
	d=google.com; s=arc-20160816;
	b=T4+evxksd2NQcnoDe0srO8WnJiTlBOTdfxmlyr66cQaD4o9xilmaYLIi7t73SenHGB
	lCQ6UHJx8ZDjzcOBMMEhzCiRhvqazL8eaKmvzgh7KNV7ETonHdb12mOKS5eJ8NVUM5Ue
	rxEvyQHmUJvbg2RbvtaE7iAQDJ6Gg+cWdEsLIkHLcEGcEMHp6bW9NFYUyjHtyyf5qEBQ
	aoMKhMafY8/szCVIEpy7RQFcNgoMbvPEsNjgkxSmx6Yv46YxIFNys1zb01a1I/894d8t
	Z1+yxRA0QDE6Iwzw/HTy35NMWn13QDKdlp21aQ1988jWOOhQGVChyWtAmqLkNSZAI0bp
	+/+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
	s=arc-20160816; 
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:dkim-signature;
	bh=WoPzmJ3QiLukxuz6DKVAzU9gkGfQvjuixc6cO7WUQs8=;
	b=qmQ/4RS1WjPW+1OE6Acxf79IEHvui2+UgtgbBv3RYxanhjLqW5Gc3RqXYYdByBNya1
	K77WUCR0X1ucfqDx8QDzskhYlK5yVt09a/IJrktidOWnaansFWgHnjAn6ymL4gFAh+If
	q0KaH25wvCkguSFLosRaIFq98NrUpTo8ey5Rc9+59Rrrj1XRPwTTuEaP6UXDRx5ToegS
	cQqoiS9X2I3yX62laZFoIlbYbGb8V7uGUQ3dY1q3hq59ePoJ6xztyDPO8fQ4U2pgskDN
	rO8sfWMh/J6s/x/KUVUAgktIzZPVTmBg6IEMKAICDHUmrMnL1aEqGblkS4R+t9ekWczD
	ODQg==
ARC-Authentication-Results: i=1; mx.google.com;
	dkim=pass header.i=@gmail.com header.s=20161025 header.b=O1FHeMjX;
	spf=pass (google.com: domain of dongsheng081251@gmail.com designates
	209.85.220.41 as permitted sender)
	smtp.mailfrom=dongsheng081251@gmail.com; 
	dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com.
	[209.85.220.41])
	by mx.google.com with SMTPS id x5sor1082014oia.131.2020.02.05.18.01.20
	(Google Transport Security); Wed, 05 Feb 2020 18:01:20 -0800 (PST)
Received-SPF: pass (google.com: domain of dongsheng081251@gmail.com designates
	209.85.220.41 as permitted sender) client-ip=209.85.220.41; 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=WoPzmJ3QiLukxuz6DKVAzU9gkGfQvjuixc6cO7WUQs8=;
	b=O1FHeMjXFSOILkBhHrqEIP2lloqCDyljt2qWbzTWoX+uBjRnfdWo3oPegsw2eoPan6
	C1NLVglsuhNd1TronEiTXa8IICi9/V4PByBGHmEuNGeHmt9+cUYfNiSyeugbj18T4X4A
	lRe5MoBgIUk0+uaSX5xvUCgK+EVAe+jADuogGP2GHgtyo/nbgmoC/pW8mJJU+ywdmj/F
	lI1I4X9/9TTjl7Eaho/qKRP/NtF9jWiBZr/lonWGDfCJqOA60V4VEBRwnMlGqkxrkzGG
	PyXyJlZAcepKi1F2fZXKQqdFr4cNvynX/17fdOYKXmqCQYftQVeTRTsPUq11KwDC7zk7
	8/6A==
X-Received: by 2002:a54:4f16:: with SMTP id e22mr5556426oiy.170.1580954479470; 
	Wed, 05 Feb 2020 18:01:19 -0800 (PST)
MIME-Version: 1.0
References: <CA+qeAOqyL5fDoFUXxVD0iaYSpY9P1qNH0Hd7eUUyGCg6hznKRQ@mail.gmail.com>
	<CA+qeAOpn85PevU6yxKqyt358ZVhdmLfwdaxvcpi4vy32Y4u8Mg@mail.gmail.com>
In-Reply-To: <CA+qeAOpn85PevU6yxKqyt358ZVhdmLfwdaxvcpi4vy32Y4u8Mg@mail.gmail.com>
From: Dongsheng Yang <dongsheng081251@gmail.com>
Date: Thu, 6 Feb 2020 10:01:07 +0800
Message-ID: <CA+qeAOoXShFs5u7JUpCSs0vV9LEkY++zLmaez8CWvZbDcD_VSQ@mail.gmail.com>
To: lars.ellenberg@linbit.com, philipp.reisner@linbit.com, 
	joel.colledge@linbit.com, linux-block@vger.kernel.org, 
	drbd-dev@lists.linbit.com
X-Mailman-Approved-At: Tue, 10 Mar 2020 17:17:51 +0100
Cc: duan.zhang@easystack.cn
Subject: [Drbd-dev] Fwd: Bug Report : meet an unexcepted WFBitMapS status
 after restarting the primary
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

QWRkaW5nIGxpbnV4LWJsb2NrIG1haWxsaXN0Li4uLi4uCgotLS0tLS0tLS0tIEZvcndhcmRlZCBt
ZXNzYWdlIC0tLS0tLS0tLQrlj5Hku7bkurrvvJogRG9uZ3NoZW5nIFlhbmcgPGRvbmdzaGVuZzA4
MTI1MUBnbWFpbC5jb20+CkRhdGU6IDIwMjDlubQy5pyINuaXpeWRqOWbmyDkuIrljYg5OjQ0ClN1
YmplY3Q6IEZ3ZDogQnVnIFJlcG9ydCA6IG1lZXQgYW4gdW5leGNlcHRlZCBXRkJpdE1hcFMgc3Rh
dHVzIGFmdGVyCnJlc3RhcnRpbmcgdGhlIHByaW1hcnkKVG86IDxsYXJzLmVsbGVuYmVyZ0BsaW5i
aXQuY29tPiwgPHBoaWxpcHAucmVpc25lckBsaW5iaXQuY29tPiwKPGxpbnV4LWJsb2NrQHZnZXIu
a2VybmVsLm9yZz4sIDxqb2VsLmNvbGxlZGdlQGxpbmJpdC5jb20+LAo8ZHJiZC1kZXZAbGlzdHMu
bGluYml0LmNvbT4KQ2M6IDxkdWFuLnpoYW5nQGVhc3lzdGFjay5jbj4KCgpIaSBQaGlsaXBwIGFu
ZCBMYXJzLAogICAgIEFueSBzdWdnZXN0aW9ucz8KClRoYW54Ci0tLS0tLS0tLS0gRm9yd2FyZGVk
IG1lc3NhZ2UgLS0tLS0tLS0tCuWPkeS7tuS6uu+8miBEb25nc2hlbmcgWWFuZyA8ZG9uZ3NoZW5n
MDgxMjUxQGdtYWlsLmNvbT4KRGF0ZTogMjAyMOW5tDLmnIg15pel5ZGo5LiJIOS4i+WNiDc6MDYK
U3ViamVjdDogQnVnIFJlcG9ydCA6IG1lZXQgYW4gdW5leGNlcHRlZCBXRkJpdE1hcFMgc3RhdHVz
IGFmdGVyCnJlc3RhcnRpbmcgdGhlIHByaW1hcnkKVG86IDxqb2VsLmNvbGxlZGdlQGxpbmJpdC5j
b20+CkNjOiA8ZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbT4sIDxkdWFuLnpoYW5nQGVhc3lzdGFj
ay5jbj4KCgpIaSBndXlzLAoKVmVyc2lvbjogZHJiZC05LjAuMjEtMQoKTGF5b3V0OiBkcmJkLnJl
cyB3aXRoaW4gMyBub2RlcyAtLSBub2RlLTEoU2Vjb25kYXJ5KSwgbm9kZS0yKFByaW1hcnkpLApu
b2RlLTMoU2Vjb25kYXJ5KQoKRGVzY3JpcHRpb246CmEucmVib290IG5vZGUtMiB3aGVuIGNsdXN0
ZXIgaXMgd29ya2luZy4KYi5yZS11cCB0aGUgZHJiZC5yZXMgb24gbm9kZS0yIGFmdGVyIGl0IHJl
c3RhcnRlZC4KYy5hbiBleHBlY3RlZCByZXN5bmMgZnJvbSBub2RlLTMgdG8gbm9kZS0yIGhhcHBl
bnMuIFdoZW4gdGhlIHJlc3luYyBpcwpkb25lLCBob3dldmVyLAogIG5vZGUtMSByYWlzZXMgYW4g
dW5leHBlY3RlZCBXRkJpdE1hcFMgcmVwbCBzdGF0dXMgYW5kIGNhbid0IHJlY292ZXIKdG8gbm9y
bWFsIGFueW1vcmUuCgpTdGF0dXMgb3V0cHV0OgoKbm9kZS0xOiBkcmJkYWRtIHN0YXR1cwoKZHJi
ZDYgcm9sZTpTZWNvbmRhcnkKCmRpc2s6VXBUb0RhdGUKCmhvdHNwYXJlIGNvbm5lY3Rpb246Q29u
bmVjdGluZwoKbm9kZS0yIHJvbGU6UHJpbWFyeQoKcmVwbGljYXRpb246V0ZCaXRNYXBTIHBlZXIt
ZGlzazpDb25zaXN0ZW50Cgpub2RlLTMgcm9sZTpTZWNvbmRhcnkKCnBlZXItZGlzazpVcFRvRGF0
ZQoKCm5vZGUtMjogZHJiZGFkbSBzdGF0dXMKCmRyYmQ2IHJvbGU6UHJpbWFyeQoKZGlzazpVcFRv
RGF0ZQoKaG90c3BhcmUgY29ubmVjdGlvbjpDb25uZWN0aW5nCgpub2RlLTEgcm9sZTpTZWNvbmRh
cnkKCnBlZXItZGlzazpVcFRvRGF0ZQoKbm9kZS0zIHJvbGU6U2Vjb25kYXJ5CgpwZWVyLWRpc2s6
VXBUb0RhdGUKCkkgYXNzdW1lIHRoYXQgdGhlcmUgaXMgYSBwcm9jZXNzIHNlcXVlbmNlIGJlbG93
IGFjY29yZGluZyB0byBteSBzb3VyY2UKY29kZSB2ZXJzaW9uOgpub2RlLTEgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbm9kZS0yCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgbm9kZS0zCiAgICAgICAgcmVzdGFydGVkIHdpdGggQ1JB
U0hFRF9QUklNQVJZCiAgICAgICAgc3RhcnQgc3luYyB3aXRoIG5vZGUtMyBhcyB0YXJnZXQKICAg
c3RhcnQgc3luYyB3aXRoIG5vZGUtMiBhcyBzb3VyY2UKICAgICAgICDigKYgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg4oCmCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbmQgc3luYyB3
aXRoIG5vZGUtMwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVu
ZCBzeW5jIHdpdGggbm9kZS0yCiAgICAgICAgd19hZnRlcl9zdGF0ZV9jaGFuZ2UKICAgICAgICAg
ICAgICAgICAgICAgIGxvb3AgMSB3aXRoaW4gZm9yIGxvb3AgYWdhaW5zdCBub2RlLTE6KGEpCnJl
Y2VpdmVfdXVpZHMxMCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzZW5kIHV1aWQg
d2l0aApVVUlEX0ZMQUdfR09UX1NUQUJMRSZDUkFTSEVEX1BSSU1BUlkgdG8gbm9kZS0xCnJlY2Vp
dmUgdXVpZCBvZiBub2RlLTIgd2l0aCBDUkFTSEVEX1BSSU1BUlkgICAgICBsb29wIDIgd2l0aGlu
IGZvcgpsb29wIGFnYWluc3Qgbm9kZS0zOgogICAgICAgIGNsZWFyICBDUkFTSEVEX1BSSU1BUlko
YikKc2VuZCB1dWlkIHRvIG5vZGUtMiB3aXRoIFVVSURfRkxBR19SRVNZTkMgICAgICAgIHJlY2Vp
dmUgdXVpZHMxMApzeW5jX2hhbmRzaGFrZSB0byBTWU5DX1NPVVJDRV9JRl9CT1RIX0ZBSUxFRCAg
ICAgc3luY19oYW5kc2hha2UgdG8gTk9fU1lOQwpjaGFuZ2UgcmVwbCBzdGF0ZSB0byBXRkJpdE1h
cFMKClRoZSBrZXkgcHJvYmxlbSBpcyBhYm91dCB0aGUgb3JkZXIgb2Ygc3RlcChhKSBhbmQgc3Rl
cChiKSwgdGhhdCBpcywKbm9kZS0yIHNlbmRzIHRoZQp1bmV4cGVjdGVkICBDUkFTSEVEX1BSSU1B
UlkgdG8gbm9kZS0xIHRob3VnaCBpdCdzIGFjdHVhbGx5IG5vIGxvbmdlciBhCmNyYXNoZWQgcHJp
bWFyeQphZnRlciBzeW5jaW5nIHdpdGggbm9kZS0zLgpTbyBtYXkgSSBoYXZlIHRoZSBiZWxvdyBx
dWVzdGlvbnM6CmEuSXMgdGhpcyByZWFsbHkgYSBCVUcgb3IganVzdCBhbiBleHBlY3RlZCByZXN1
bHQ/CmIuSWYgdGhlcmUncyBhbHJlYWR5IGEgcGF0Y2ggZml4IHdpdGhpbiB0aGUgbmV3ZXN0IHZl
cmlvbj8KYy5JZiB0aGVyZSdzIHNvbWUgd29ya2Fyb3VuZCBtZXRob2QgYWdhaW5zdCB0aGlzIGtp
bmQgb2YgdW5leGNlcHRlZApzdGF0dXMsIHNpbmNlIEkgcmVhbGx5CiAgbWVldCBzbyBtYW55IG90
aGVyIHByb2JsZW1zIGxpa2UgdGhhdCA6KApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMubGlu
Yml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRl
dgo=
