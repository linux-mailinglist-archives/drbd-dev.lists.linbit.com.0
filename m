Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 82148792C54
	for <lists+drbd-dev@lfdr.de>; Tue,  5 Sep 2023 19:24:20 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D834D4203CF;
	Tue,  5 Sep 2023 19:24:19 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
	[209.85.218.44])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8166D42018E
	for <drbd-dev@lists.linbit.com>; Tue,  5 Sep 2023 19:24:17 +0200 (CEST)
Received: by mail-ej1-f44.google.com with SMTP id
	a640c23a62f3a-99cce6f7de2so411183766b.3
	for <drbd-dev@lists.linbit.com>; Tue, 05 Sep 2023 10:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1693934657;
	x=1694539457; darn=lists.linbit.com; 
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=toLHVDzgNaAzaAmVAyotDH7xDpEMacIl37ejxJnj4NM=;
	b=Q65f2qyUxw6ofYyT5LOOm2s5733XrXJxH5RNWro6w75peSKR0iTpSJBuFfY4qZ+GGH
	lOUpigwzfYF3qDkK1iCagp0GNS77Rh2r36Y1k1L+3Dyyqb/D+OEzMHan1ytWvZmh6p9v
	eizoPi+T+dlHetZgqNtzm5EnCin/+kCujWzP9YYJxP8vrAKRImRZr63WiCtm5G/OZBmy
	l1qSG+tfZhTiLRI/K1EYQAIpCnDjnpVWWeWS7GqQKHxot5XmkmkmCe4nuLzc3pLXD/6E
	MhpCYD4Ll6Eo9jtwNZsBuQa0sQzi014PM2bpaG3rjjsh2VRV8RyeNBEYW0eebog6yaHd
	VP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20221208; t=1693934657; x=1694539457;
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=toLHVDzgNaAzaAmVAyotDH7xDpEMacIl37ejxJnj4NM=;
	b=c/aq2cN0tcWlxUEXRVIKHkCvxTiQruQBisLUonAYZ+vPEgsCWYwZGTpfs9OjREUTHr
	tCpB3KdMvCjS6xgyebL086bzcFZiQrvusEHhyjgJxbLyizDvuzznjlHe7TU2HYJvdN2G
	N87xGk9Emb63UvBHL5Cfx2L+KXzLR3yBljJ7Bs3pL4lwEp3BukGwj+/qtvV8rZG0t933
	q+A4jujkuHYRQfvyvKKWqGdz0NeheJeQon4eKN4x0hhXKDCJPh2/sv2Ei5oFE+mjdfRx
	7iCAFSPUsYL9hq8V4XRrn/HbXvDzDywIVMlioLtXBr/+ZlmAboUgrc1//gWxYD3xQBWJ
	gxTw==
X-Gm-Message-State: AOJu0YwZh9rhd5Fw2TjLGMtrLdSIfCK7cVSW3IsE87DWDRYILqE6BGY0
	q+1cuqsU0Ng8SzB6Pz++e5Y9SVRJ
X-Google-Smtp-Source: AGHT+IEeOxfQYdFYPLVeZB4D3mT3jO5bhrV7jF88hHN5iig58fkbLVRyPDxhTuyhWPKmcgXFJNnjbw==
X-Received: by 2002:a17:906:5a59:b0:9a4:dd49:da3e with SMTP id
	my25-20020a1709065a5900b009a4dd49da3emr413456ejc.68.1693934656736;
	Tue, 05 Sep 2023 10:24:16 -0700 (PDT)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	e6-20020a17090681c600b00992a8a54f32sm7791342ejx.139.2023.09.05.10.24.15
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 05 Sep 2023 10:24:16 -0700 (PDT)
Message-ID: <525c0143-4f72-31c3-8a83-ee29c699e1e7@linbit.com>
Date: Tue, 5 Sep 2023 19:24:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
	Thunderbird/102.13.0
To: Linux regressions mailing list <regressions@lists.linux.dev>,
	Serguei Ivantsov <manowar@gsc-game.com>
References: <CAKH+VT3YLmAn0Y8=q37UTDShqxDLsqPcQ4hBMzY7HPn7zNx+RQ@mail.gmail.com>
	<c6282b47-114d-7bd7-6efb-856d76bea128@leemhuis.info>
Content-Language: en-US
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <c6282b47-114d-7bd7-6efb-856d76bea128@leemhuis.info>
Cc: David Howells <dhowells@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] DRBD broken in kernel 6.5 and 6.5.1
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

QW0gMDMuMDkuMjMgdW0gMDc6NDUgc2NocmllYiBMaW51eCByZWdyZXNzaW9uIHRyYWNraW5nIChU
aG9yc3RlbiBMZWVtaHVpcyk6Cj4gQ0NpbmcgdGhlIERSQkQgbWFpbnRhaW5lcnMgYW5kIHRoZSBh
cHByb3ByaWF0ZSBsaXN0cywgYXMgdGhleSBzaG91bGQKPiBrbm93IGFib3V0IHRoaXMgLS0gb3Ig
YWN0dWFsbHkgbWlnaHQga25vdyB3aGF0IGlzIGNhdXNpbmcgdGhpcyBhbHJlYWR5Cj4gb3IgYmUg
YWJsZSB0byBndWVzcyB0aGUgY2F1c2UuIEZvciB0aGUgcmVzdCBvZiB0aGlzIG1haWw6Cj4gCj4g
W1RMRFI6IEknbSBhZGRpbmcgdGhpcyByZXBvcnQgdG8gdGhlIGxpc3Qgb2YgdHJhY2tlZCBMaW51
eCBrZXJuZWwKPiByZWdyZXNzaW9uczsgdGhlIHRleHQgeW91IGZpbmQgYmVsb3cgaXMgYmFzZWQg
b24gYSBmZXcgdGVtcGxhdGVzCj4gcGFyYWdyYXBocyB5b3UgbWlnaHQgaGF2ZSBlbmNvdW50ZXJl
ZCBhbHJlYWR5IGluIHNpbWlsYXIgZm9ybS5dCj4gCj4gT24gMDIuMDkuMjMgMjI6MzcsIFNlcmd1
ZWkgSXZhbnRzb3Ygd3JvdGU6Cj4+IEhlbGxvLAo+Pgo+PiBBZnRlciB1cGdyYWRpbmcgdGhlIGtl
cm5lbCB0byA2LjUgdGhlIHN5c3RlbSBjYW4ndCBjb25uZWN0IHRvIHRoZSBwZWVyCj4+ICg2LjQu
MTEpIGFueW1vcmUuCj4+IEkgY2hlY2tlZCA2LjUuMSAtIHNhbWUgaXNzdWUuCj4+IEFsbCBwcmV2
aW91cyBrZXJuZWxzIGluY2x1ZGluZyA2LjQuMTQgYXJlIHdvcmtpbmcganVzdCBmaW5lLgo+PiBD
aGVja2luZyB0aGUgNi41IGNoYW5nZWxvZywgSSBmb3VuZCBjb21taXQKPj4gOWFlNDQwYjhmZGQ2
NzcyYjZjMDA3ZmEzZDM3NjY1MzBhMDljOTA0NSB3aGljaCBtZW50aW9uZWQgc29tZSBjaGFuZ2Vz
Cj4+IHRvIERSQkQuCj4+Cj4+IE9uIHRoZSA2LjUuWCBzeXN0ZW0gSSBoYXZlIHRoZSBmb2xsb3dp
bmcgaW4gdGhlIGtlcm5lbCBsb2cKPj4gKGRyYmRfc2VuZF9ibG9jaygpIGZhaWxlZCk6Cj4+Cj4+
IFsgICAgMi40NzM0OTddIGRyYmQ6IGluaXRpYWxpemVkLiBWZXJzaW9uOiA4LjQuMTEgKGFwaTox
L3Byb3RvOjg2LTEwMSkKPj4KPj4gWyAgICAyLjQ3NTM5NF0gZHJiZDogYnVpbHQtaW4KPj4KPj4g
WyAgICAyLjQ3NzI1NF0gZHJiZDogcmVnaXN0ZXJlZCBhcyBibG9jayBkZXZpY2UgbWFqb3IgMTQ3
Cj4+Cj4+IFsgICAgNy40MjE0MDBdIGRyYmQgZHJiZDA6IFN0YXJ0aW5nIHdvcmtlciB0aHJlYWQg
KGZyb20gZHJiZHNldHVwLTg0IFszODQ0XSkKPj4KPj4gWyAgICA3LjQyMTUwOV0gZHJiZCBkcmJk
MC8wIGRyYmQwOiBkaXNrKCBEaXNrbGVzcyAtPiBBdHRhY2hpbmcgKQo+Pgo+PiBbICAgIDcuNDIx
NTUyXSBkcmJkIGRyYmQwOiBNZXRob2QgdG8gZW5zdXJlIHdyaXRlIG9yZGVyaW5nOiBmbHVzaAo+
Pgo+PiBbICAgIDcuNDIxNTU0XSBkcmJkIGRyYmQwLzAgZHJiZDA6IG1heCBCSU8gc2l6ZSA9IDEz
MTA3Mgo+Pgo+PiBbICAgIDcuNDIxNTU3XSBkcmJkIGRyYmQwLzAgZHJiZDA6IGRyYmRfYm1fcmVz
aXplIGNhbGxlZCB3aXRoIGNhcGFjaXR5Cj4+ID09IDE4NDUxNzMxODQKPj4KPj4gWyAgICA3LjQy
ODAxN10gZHJiZCBkcmJkMC8wIGRyYmQwOiByZXN5bmMgYml0bWFwOiBiaXRzPTIzMDY0NjY0OAo+
PiB3b3Jkcz0zNjAzODU0IHBhZ2VzPTcwMzkKPj4KPj4gWyAgICA3LjQ2NzM3MF0gZHJiZDA6IGRl
dGVjdGVkIGNhcGFjaXR5IGNoYW5nZSBmcm9tIDAgdG8gMTg0NTE3MzE4NAo+Pgo+PiBbICAgIDcu
NDY3MzcyXSBkcmJkIGRyYmQwLzAgZHJiZDA6IHNpemUgPSA4ODAgR0IgKDkyMjU4NjU5MiBLQikK
Pj4KPj4gWyAgICA3LjQ4NjAwNV0gZHJiZCBkcmJkMC8wIGRyYmQwOiByZWNvdW50aW5nIG9mIHNl
dCBiaXRzIHRvb2sKPj4gYWRkaXRpb25hbCAwIGppZmZpZXMKPj4KPj4gWyAgICA3LjQ4NjAxMF0g
ZHJiZCBkcmJkMC8wIGRyYmQwOiAwIEtCICgwIGJpdHMpIG1hcmtlZCBvdXQtb2Ytc3luYyBieQo+
PiBvbiBkaXNrIGJpdC1tYXAuCj4+Cj4+IFsgICAgNy40ODYwMTddIGRyYmQgZHJiZDAvMCBkcmJk
MDogZGlzayggQXR0YWNoaW5nIC0+IFVwVG9EYXRlICkKPj4KPj4gWyAgICA3LjQ4NjAyMV0gZHJi
ZCBkcmJkMC8wIGRyYmQwOiBhdHRhY2hlZCB0byBVVUlEcwo+PiAzMkREQjIwMTk3MDhGNjhBOjAw
MDAwMDAwMDAwMDAwMDA6N0Q5NzY0ODU5OUI0NDZERDo3RDk2NjQ4NTk5QjQ0NkRECj4+Cj4+IFsg
ICAgNy40ODY4NjNdIGRyYmQgZHJiZDA6IGNvbm4oIFN0YW5kQWxvbmUgLT4gVW5jb25uZWN0ZWQg
KQo+Pgo+PiBbICAgIDcuNDg2ODcxXSBkcmJkIGRyYmQwOiBTdGFydGluZyByZWNlaXZlciB0aHJl
YWQgKGZyb20gZHJiZF93X2RyYmQwIFszODQ3XSkKPj4KPj4gWyAgICA3LjQ4NjkxOF0gZHJiZCBk
cmJkMDogcmVjZWl2ZXIgKHJlKXN0YXJ0ZWQKPj4KPj4gWyAgICA3LjQ4NjkyOV0gZHJiZCBkcmJk
MDogY29ubiggVW5jb25uZWN0ZWQgLT4gV0ZDb25uZWN0aW9uICkKPj4KPj4gWyAgIDEyLjM0MDIx
Ml0gZHJiZCBkcmJkMDogaW5pdGlhbCBwYWNrZXQgUyBjcm9zc2VkCj4+Cj4+IFsgICAyMi4zMTA4
NTZdIGRyYmQgZHJiZDA6IEhhbmRzaGFrZSBzdWNjZXNzZnVsOiBBZ3JlZWQgbmV0d29yawo+PiBw
cm90b2NvbCB2ZXJzaW9uIDEwMQo+Pgo+PiBbICAgMjIuMzExMDg3XSBkcmJkIGRyYmQwOiBGZWF0
dXJlIGZsYWdzIGVuYWJsZWQgb24gcHJvdG9jb2wgbGV2ZWw6Cj4+IDB4ZiBUUklNIFRISU5fUkVT
WU5DIFdSSVRFX1NBTUUgV1JJVEVfWkVST0VTLgo+Pgo+PiBbICAgMjIuMzExNDI1XSBkcmJkIGRy
YmQwOiBjb25uKCBXRkNvbm5lY3Rpb24gLT4gV0ZSZXBvcnRQYXJhbXMgKQo+Pgo+PiBbICAgMjIu
MzExNjIxXSBkcmJkIGRyYmQwOiBTdGFydGluZyBhY2tfcmVjdiB0aHJlYWQgKGZyb20gZHJiZF9y
X2RyYmQwIFs0MDcxXSkKPj4KPj4gWyAgIDIyLjQwMDcwMl0gZHJiZCBkcmJkMC8wIGRyYmQwOiBk
cmJkX3N5bmNfaGFuZHNoYWtlOgo+Pgo+PiBbICAgMjIuNDAwODY5XSBkcmJkIGRyYmQwLzAgZHJi
ZDA6IHNlbGYKPj4gMzJEREIyMDE5NzA4RjY4QTowMDAwMDAwMDAwMDAwMDAwOjdEOTc2NDg1OTlC
NDQ2REQ6N0Q5NjY0ODU5OUI0NDZERAo+PiBiaXRzOjAgZmxhZ3M6MAo+Pgo+PiBbICAgMjIuNDAx
MjA1XSBkcmJkIGRyYmQwLzAgZHJiZDA6IHBlZXIKPj4gMzJEREIyMDE5NzA4RjY4QTowMDAwMDAw
MDAwMDAwMDAwOjdEOTc2NDg1OTlCNDQ2REM6N0Q5NjY0ODU5OUI0NDZERAo+PiBiaXRzOjAgZmxh
Z3M6MAo+Pgo+PiBbICAgMjIuNDAxNTM4XSBkcmJkIGRyYmQwLzAgZHJiZDA6IHV1aWRfY29tcGFy
ZSgpPTAgYnkgcnVsZSA0MAo+Pgo+PiBbICAgMjIuNDAxNzA5XSBkcmJkIGRyYmQwLzAgZHJiZDA6
IHBlZXIoIFVua25vd24gLT4gU2Vjb25kYXJ5ICkgY29ubigKPj4gV0ZSZXBvcnRQYXJhbXMgLT4g
Q29ubmVjdGVkICkgcGRzayggRFVua25vd24gLT4gVXBUb0RhdGUgKQo+Pgo+PiBbICAgMjIuNDE1
Mzk0XSBkcmJkIGRyYmQwLzAgZHJiZDA6IHJvbGUoIFNlY29uZGFyeSAtPiBQcmltYXJ5ICkKPj4K
Pj4gWyAgIDIyLjUwNjU0MF0gZHJiZCBkcmJkMC8wIGRyYmQwOiBfZHJiZF9zZW5kX3BhZ2U6IHNp
emU9NDA5NiBsZW49NDA5NiBzZW50PS01Cj4+Cj4+IFsgICAyMi41MDY3NzNdIGRyYmQgZHJiZDA6
IHBlZXIoIFNlY29uZGFyeSAtPiBVbmtub3duICkgY29ubigKPj4gQ29ubmVjdGVkIC0+IE5ldHdv
cmtGYWlsdXJlICkgcGRzayggVXBUb0RhdGUgLT4gRFVua25vd24gKQo+Pgo+PiBbICAgMjIuNTA3
MTA5XSBkcmJkIGRyYmQwLzAgZHJiZDA6IG5ldyBjdXJyZW50IFVVSUQKPj4gN0Y4QjE1QzA0QUY0
OUM0RDozMkREQjIwMTk3MDhGNjhCOjdEOTc2NDg1OTlCNDQ2REQ6N0Q5NjY0ODU5OUI0NDZERAo+
Pgo+PiBbICAgMjIuNTA3NDUxXSBkcmJkIGRyYmQwOiBhY2tfcmVjZWl2ZXIgdGVybWluYXRlZAo+
Pgo+PiBbICAgMjIuNTA3NTg4XSBkcmJkIGRyYmQwOiBUZXJtaW5hdGluZyBkcmJkX2FfZHJiZDAK
Pj4KPj4gWyAgIDIyLjYwMDY5M10gZHJiZCBkcmJkMDogQ29ubmVjdGlvbiBjbG9zZWQKPj4KPj4g
WyAgIDIyLjYwMDkzN10gZHJiZCBkcmJkMDogY29ubiggTmV0d29ya0ZhaWx1cmUgLT4gVW5jb25u
ZWN0ZWQgKQo+Pgo+PiBbICAgMjIuNjAxMTE1XSBkcmJkIGRyYmQwOiByZWNlaXZlciB0ZXJtaW5h
dGVkCj4+Cj4+IFsgICAyMi42MDEyMzhdIGRyYmQgZHJiZDA6IFJlc3RhcnRpbmcgcmVjZWl2ZXIg
dGhyZWFkCj4+Cj4+IFsgICAyMi42MDEzNzhdIGRyYmQgZHJiZDA6IHJlY2VpdmVyIChyZSlzdGFy
dGVkCj4+Cj4+IFsgICAyMi42MDE1MDhdIGRyYmQgZHJiZDA6IGNvbm4oIFVuY29ubmVjdGVkIC0+
IFdGQ29ubmVjdGlvbiApCj4+Cj4+IFsgICAyMy4yNjA2MjRdIGRyYmQgZHJiZDA6IEhhbmRzaGFr
ZSBzdWNjZXNzZnVsOiBBZ3JlZWQgbmV0d29yawo+PiBwcm90b2NvbCB2ZXJzaW9uIDEwMQo+Pgo+
PiBbICAgMjMuMjYwODU5XSBkcmJkIGRyYmQwOiBGZWF0dXJlIGZsYWdzIGVuYWJsZWQgb24gcHJv
dG9jb2wgbGV2ZWw6Cj4+IDB4ZiBUUklNIFRISU5fUkVTWU5DIFdSSVRFX1NBTUUgV1JJVEVfWkVS
T0VTLgo+Pgo+PiBbICAgMjMuMjYxMTg3XSBkcmJkIGRyYmQwOiBjb25uKCBXRkNvbm5lY3Rpb24g
LT4gV0ZSZXBvcnRQYXJhbXMgKQo+Pgo+PiBbICAgMjMuMjYxMzY3XSBkcmJkIGRyYmQwOiBTdGFy
dGluZyBhY2tfcmVjdiB0aHJlYWQgKGZyb20gZHJiZF9yX2RyYmQwIFs0MDcxXSkKPj4KPj4gWyAg
IDIzLjM0MDU5M10gZHJiZCBkcmJkMC8wIGRyYmQwOiBkcmJkX3N5bmNfaGFuZHNoYWtlOgo+Pgo+
PiBbICAgMjMuMzQwNzcxXSBkcmJkIGRyYmQwLzAgZHJiZDA6IHNlbGYKPj4gN0Y4QjE1QzA0QUY0
OUM0RDozMkREQjIwMTk3MDhGNjhCOjdEOTc2NDg1OTlCNDQ2REQ6N0Q5NjY0ODU5OUI0NDZERAo+
PiBiaXRzOjEgZmxhZ3M6MAo+Pgo+PiBbICAgMjMuMzQxMTkyXSBkcmJkIGRyYmQwLzAgZHJiZDA6
IHBlZXIKPj4gMzJEREIyMDE5NzA4RjY4QTowMDAwMDAwMDAwMDAwMDAwOjdEOTc2NDg1OTlCNDQ2
REM6N0Q5NjY0ODU5OUI0NDZERAo+PiBiaXRzOjAgZmxhZ3M6MAo+Pgo+PiBbICAgMjMuMzQxNjQ5
XSBkcmJkIGRyYmQwLzAgZHJiZDA6IHV1aWRfY29tcGFyZSgpPTEgYnkgcnVsZSA3MAo+Pgo+PiBb
ICAgMjMuMzQxODI0XSBkcmJkIGRyYmQwLzAgZHJiZDA6IHBlZXIoIFVua25vd24gLT4gU2Vjb25k
YXJ5ICkgY29ubigKPj4gV0ZSZXBvcnRQYXJhbXMgLT4gV0ZCaXRNYXBTICkgcGRzayggRFVua25v
d24gLT4gQ29uc2lzdGVudCApCj4+Cj4+IFsgICAyMy4zNDQ5MTFdIGRyYmQgZHJiZDAvMCBkcmJk
MDogc2VuZCBiaXRtYXAgc3RhdHMgW0J5dGVzKHBhY2tldHMpXToKPj4gcGxhaW4gMCgwKSwgUkxF
IDIzKDEpLCB0b3RhbCAyMzsgY29tcHJlc3Npb246IDEwMC4wJQo+Pgo+PiBbICAgMjMuMzk2Nzky
XSBkcmJkIGRyYmQwLzAgZHJiZDA6IHJlY2VpdmUgYml0bWFwIHN0YXRzCj4+IFtCeXRlcyhwYWNr
ZXRzKV06IHBsYWluIDAoMCksIFJMRSAyMygxKSwgdG90YWwgMjM7IGNvbXByZXNzaW9uOiAxMDAu
MCUKPj4KPj4gWyAgIDIzLjM5NzIxMF0gZHJiZCBkcmJkMC8wIGRyYmQwOiBoZWxwZXIgY29tbWFu
ZDogL3NiaW4vZHJiZGFkbQo+PiBiZWZvcmUtcmVzeW5jLXNvdXJjZSBtaW5vci0wCj4+Cj4+IFsg
ICAyMy40MDc5NjVdIGRyYmQgZHJiZDAvMCBkcmJkMDogaGVscGVyIGNvbW1hbmQ6IC9zYmluL2Ry
YmRhZG0KPj4gYmVmb3JlLXJlc3luYy1zb3VyY2UgbWlub3ItMCBleGl0IGNvZGUgMCAoMHgwKQo+
Pgo+PiBbICAgMjMuNDE3NTQ3XSBkcmJkIGRyYmQwLzAgZHJiZDA6IGNvbm4oIFdGQml0TWFwUyAt
PiBTeW5jU291cmNlICkKPj4gcGRzayggQ29uc2lzdGVudCAtPiBJbmNvbnNpc3RlbnQgKQo+Pgo+
PiBbICAgMjMuNDI2Njk3XSBkcmJkIGRyYmQwLzAgZHJiZDA6IEJlZ2FuIHJlc3luYyBhcyBTeW5j
U291cmNlICh3aWxsCj4+IHN5bmMgNCBLQiBbMSBiaXRzIHNldF0pLgo+Pgo+PiBbICAgMjMuNDM1
NjM4XSBkcmJkIGRyYmQwLzAgZHJiZDA6IHVwZGF0ZWQgc3luYyBVVUlECj4+IDdGOEIxNUMwNEFG
NDlDNEQ6MzJERUIyMDE5NzA4RjY4QjozMkREQjIwMTk3MDhGNjhCOjdEOTc2NDg1OTlCNDQ2REQK
Pj4KPj4gWyAgIDIzLjQ4ODYwOF0gZHJiZCBkcmJkMC8wIGRyYmQwOiBfZHJiZF9zZW5kX3BhZ2U6
IHNpemU9NDA5NiBsZW49NDA5NiBzZW50PS01Cj4+Cj4+IFsgICAyMy40OTgxODJdIGRyYmQgZHJi
ZDAvMCBkcmJkMDogZHJiZF9zZW5kX2Jsb2NrKCkgZmFpbGVkCj4+Cj4+IFsgICAyMy41MDg0OThd
IGRyYmQgZHJiZDA6IHBlZXIoIFNlY29uZGFyeSAtPiBVbmtub3duICkgY29ubigKPj4gU3luY1Nv
dXJjZSAtPiBOZXR3b3JrRmFpbHVyZSApCj4+Cj4+IFsgICAyMy41MTc1OTddIGRyYmQgZHJiZDA6
IGFja19yZWNlaXZlciB0ZXJtaW5hdGVkCj4+Cj4+IFsgICAyMy41Mjc1MTNdIGRyYmQgZHJiZDA6
IFRlcm1pbmF0aW5nIGRyYmRfYV9kcmJkMAo+Pgo+PiBbICAgMjMuNjkwNTk4XSBkcmJkIGRyYmQw
OiBDb25uZWN0aW9uIGNsb3NlZAo+Pgo+PiBbICAgMjMuNzAxODU3XSBkcmJkIGRyYmQwOiBjb25u
KCBOZXR3b3JrRmFpbHVyZSAtPiBVbmNvbm5lY3RlZCApCj4+Cj4+IFsgICAyMy43MTIwMTddIGRy
YmQgZHJiZDA6IHJlY2VpdmVyIHRlcm1pbmF0ZWQKPj4KPj4gWyAgIDIzLjcyMTU5N10gZHJiZCBk
cmJkMDogUmVzdGFydGluZyByZWNlaXZlciB0aHJlYWQKPj4KPj4KPj4KPj4gT24gdGhlIHBlZXI6
Cj4+Cj4+Cj4+IFszNDkwNzEuMDM4Mjc4XSBkcmJkIGRyYmQwOiBjb25uKCBVbmNvbm5lY3RlZCAt
PiBXRkNvbm5lY3Rpb24gKQo+Pgo+PiBbMzQ5MDcxLjU1ODI0NV0gZHJiZCBkcmJkMDogSGFuZHNo
YWtlIHN1Y2Nlc3NmdWw6IEFncmVlZCBuZXR3b3JrCj4+IHByb3RvY29sIHZlcnNpb24gMTAxCj4+
Cj4+IFszNDkwNzEuNTYyMTA1XSBkcmJkIGRyYmQwOiBGZWF0dXJlIGZsYWdzIGVuYWJsZWQgb24g
cHJvdG9jb2wgbGV2ZWw6Cj4+IDB4ZiBUUklNIFRISU5fUkVTWU5DIFdSSVRFX1NBTUUgV1JJVEVf
WkVST0VTLgo+Pgo+PiBbMzQ5MDcxLjU2OTg4OV0gZHJiZCBkcmJkMDogY29ubiggV0ZDb25uZWN0
aW9uIC0+IFdGUmVwb3J0UGFyYW1zICkKPj4KPj4gWzM0OTA3MS41NzM4MDJdIGRyYmQgZHJiZDA6
IFN0YXJ0aW5nIGFja19yZWN2IHRocmVhZCAoZnJvbSBkcmJkX3JfZHJiZDAgWzI2NjBdKQo+Pgo+
PiBbMzQ5MDcxLjY4ODU0N10gZHJiZCBkcmJkMC8wIGRyYmQwOiBkcmJkX3N5bmNfaGFuZHNoYWtl
Ogo+Pgo+PiBbMzQ5MDcxLjY5MjMyM10gZHJiZCBkcmJkMC8wIGRyYmQwOiBzZWxmCj4+IDMzNzVC
MjAxOTcwOEY2OEE6MDAwMDAwMDAwMDAwMDAwMDo3RDk3NjQ4NTk5QjQ0NkRDOjdEOTY2NDg1OTlC
NDQ2REQKPj4gYml0czoxIGZsYWdzOjAKPj4KPj4gWzM0OTA3MS42OTk4NzFdIGRyYmQgZHJiZDAv
MCBkcmJkMDogcGVlcgo+PiA3RjhCMTVDMDRBRjQ5QzREOjMzNzVCMjAxOTcwOEY2OEI6MzM3NEIy
MDE5NzA4RjY4QjozMzczQjIwMTk3MDhGNjhCCj4+IGJpdHM6MSBmbGFnczowCj4+Cj4+IFszNDkw
NzEuNzA3Njg3XSBkcmJkIGRyYmQwLzAgZHJiZDA6IHV1aWRfY29tcGFyZSgpPS0xIGJ5IHJ1bGUg
NTAKPj4KPj4gWzM0OTA3MS43MTE1NjNdIGRyYmQgZHJiZDAvMCBkcmJkMDogQmVjb21pbmcgc3lu
YyB0YXJnZXQgZHVlIHRvIGRpc2sgc3RhdGVzLgo+Pgo+PiBbMzQ5MDcxLjcxNTM4MV0gZHJiZCBk
cmJkMC8wIGRyYmQwOiBwZWVyKCBVbmtub3duIC0+IFByaW1hcnkgKSBjb25uKAo+PiBXRlJlcG9y
dFBhcmFtcyAtPiBXRkJpdE1hcFQgKSBwZHNrKCBEVW5rbm93biAtPiBVcFRvRGF0ZSApCj4+Cj4+
IFszNDkwNzEuNzIzMDM5XSBkcmJkIGRyYmQwLzAgZHJiZDA6IHJlY2VpdmUgYml0bWFwIHN0YXRz
Cj4+IFtCeXRlcyhwYWNrZXRzKV06IHBsYWluIDAoMCksIFJMRSAyMygxKSwgdG90YWwgMjM7IGNv
bXByZXNzaW9uOiAxMDAuMCUKPj4KPj4gWzM0OTA3MS43MzI0ODldIGRyYmQgZHJiZDAvMCBkcmJk
MDogc2VuZCBiaXRtYXAgc3RhdHMKPj4gW0J5dGVzKHBhY2tldHMpXTogcGxhaW4gMCgwKSwgUkxF
IDIzKDEpLCB0b3RhbCAyMzsgY29tcHJlc3Npb246IDEwMC4wJQo+Pgo+PiBbMzQ5MDcxLjc0MDE3
OF0gZHJiZCBkcmJkMC8wIGRyYmQwOiBjb25uKCBXRkJpdE1hcFQgLT4gV0ZTeW5jVVVJRCApCj4+
Cj4+IFszNDkwNzEuNzg3MTEzXSBkcmJkIGRyYmQwLzAgZHJiZDA6IHVwZGF0ZWQgc3luYyB1dWlk
Cj4+IDMzNzZCMjAxOTcwOEY2OEE6MDAwMDAwMDAwMDAwMDAwMDo3RDk3NjQ4NTk5QjQ0NkRDOjdE
OTY2NDg1OTlCNDQ2REQKPj4KPj4gWzM0OTA3MS43OTQ5MDddIGRyYmQgZHJiZDAvMCBkcmJkMDog
aGVscGVyIGNvbW1hbmQ6IC9zYmluL2RyYmRhZG0KPj4gYmVmb3JlLXJlc3luYy10YXJnZXQgbWlu
b3ItMAo+Pgo+PiBbMzQ5MDcxLjgwMDAwNl0gZHJiZCBkcmJkMC8wIGRyYmQwOiBoZWxwZXIgY29t
bWFuZDogL3NiaW4vZHJiZGFkbQo+PiBiZWZvcmUtcmVzeW5jLXRhcmdldCBtaW5vci0wIGV4aXQg
Y29kZSAwICgweDApCj4+Cj4+IFszNDkwNzEuODA3NzM3XSBkcmJkIGRyYmQwLzAgZHJiZDA6IGNv
bm4oIFdGU3luY1VVSUQgLT4gU3luY1RhcmdldCApCj4+Cj4+IFszNDkwNzEuODExNjM5XSBkcmJk
IGRyYmQwLzAgZHJiZDA6IEJlZ2FuIHJlc3luYyBhcyBTeW5jVGFyZ2V0ICh3aWxsCj4+IHN5bmMg
NCBLQiBbMSBiaXRzIHNldF0pLgo+Pgo+PiBbMzQ5MDcxLjkxNjExN10gZHJiZCBkcmJkMDogc29j
ayB3YXMgc2h1dCBkb3duIGJ5IHBlZXIKPj4KPj4gWzM0OTA3MS45MTk5NTVdIGRyYmQgZHJiZDA6
IHBlZXIoIFByaW1hcnkgLT4gVW5rbm93biApIGNvbm4oCj4+IFN5bmNUYXJnZXQgLT4gQnJva2Vu
UGlwZSApIHBkc2soIFVwVG9EYXRlIC0+IERVbmtub3duICkKPj4KPj4gWzM0OTA3MS45Mjc3OTZd
IGRyYmQgZHJiZDA6IHNob3J0IHJlYWQgKGV4cGVjdGVkIHNpemUgNDA5NikKPj4KPj4gWzM0OTA3
MS45MzE4MTJdIGRyYmQgZHJiZDA6IGVycm9yIHJlY2VpdmluZyBSU0RhdGFSZXBseSwgZTogLTUg
bDogNDA5NiEKPj4KPj4gWzM0OTA3MS45MzU4NjRdIGRyYmQgZHJiZDA6IGFja19yZWNlaXZlciB0
ZXJtaW5hdGVkCj4+Cj4+IFszNDkwNzEuOTM5OTA2XSBkcmJkIGRyYmQwOiBUZXJtaW5hdGluZyBk
cmJkX2FfZHJiZDAKPj4KPj4gWzM0OTA3Mi4wODgzODVdIGRyYmQgZHJiZDA6IENvbm5lY3Rpb24g
Y2xvc2VkCj4+Cj4+IFszNDkwNzIuMDkyMzk4XSBkcmJkIGRyYmQwOiBjb25uKCBCcm9rZW5QaXBl
IC0+IFVuY29ubmVjdGVkICkKPj4KPj4gWzM0OTA3Mi4wOTY0MzZdIGRyYmQgZHJiZDA6IHJlY2Vp
dmVyIHRlcm1pbmF0ZWQKPj4KPj4gWzM0OTA3Mi4xMDA0NjldIGRyYmQgZHJiZDA6IFJlc3RhcnRp
bmcgcmVjZWl2ZXIgdGhyZWFkCj4+Cj4+IFszNDkwNzIuMTA0NDU0XSBkcmJkIGRyYmQwOiByZWNl
aXZlciAocmUpc3RhcnRlZAo+Pgo+PiBbMzQ5MDcyLjEwODM3M10gZHJiZCBkcmJkMDogY29ubigg
VW5jb25uZWN0ZWQgLT4gV0ZDb25uZWN0aW9uICkKPj4KPj4KPj4gLS0KPj4KPj4gIEJlc3QgUmVn
YXJkcywKPj4KPj4gIFNlcmd1ZWkKPiAKPiAKPiBUaGFua3MgZm9yIHRoZSByZXBvcnQuIFRvIGJl
IHN1cmUgdGhlIGlzc3VlIGRvZXNuJ3QgZmFsbCB0aHJvdWdoIHRoZQo+IGNyYWNrcyB1bm5vdGlj
ZWQsIEknbSBhZGRpbmcgaXQgdG8gcmVnemJvdCwgdGhlIExpbnV4IGtlcm5lbCByZWdyZXNzaW9u
Cj4gdHJhY2tpbmcgYm90Ogo+IAo+ICNyZWd6Ym90IF5pbnRyb2R1Y2VkIHY2LjQuLnY2LjUKPiAj
cmVnemJvdCB0aXRsZSBkcmJkOiBkcmJkX3NlbmRfYmxvY2soKSBmYWlsZWQKPiAjcmVnemJvdCBp
Z25vcmUtYWN0aXZpdHkKPiAKPiBUaGlzIGlzbid0IGEgcmVncmVzc2lvbj8gVGhpcyBpc3N1ZSBv
ciBhIGZpeCBmb3IgaXQgYXJlIGFscmVhZHkKPiBkaXNjdXNzZWQgc29tZXdoZXJlIGVsc2U/IEl0
IHdhcyBmaXhlZCBhbHJlYWR5PyBZb3Ugd2FudCB0byBjbGFyaWZ5IHdoZW4KPiB0aGUgcmVncmVz
c2lvbiBzdGFydGVkIHRvIGhhcHBlbj8gT3IgcG9pbnQgb3V0IEkgZ290IHRoZSB0aXRsZSBvcgo+
IHNvbWV0aGluZyBlbHNlIHRvdGFsbHkgd3Jvbmc/IFRoZW4ganVzdCByZXBseSBhbmQgdGVsbCBt
ZSAtLSBpZGVhbGx5Cj4gd2hpbGUgYWxzbyB0ZWxsaW5nIHJlZ3pib3QgYWJvdXQgaXQsIGFzIGV4
cGxhaW5lZCBieSB0aGUgcGFnZSBsaXN0ZWQgaW4KPiB0aGUgZm9vdGVyIG9mIHRoaXMgbWFpbC4K
PiAKPiBEZXZlbG9wZXJzOiBXaGVuIGZpeGluZyB0aGUgaXNzdWUsIHJlbWVtYmVyIHRvIGFkZCAn
TGluazonIHRhZ3MgcG9pbnRpbmcKPiB0byB0aGUgcmVwb3J0ICh0aGUgcGFyZW50IG9mIHRoaXMg
bWFpbCkuIFNlZSBwYWdlIGxpbmtlZCBpbiBmb290ZXIgZm9yCj4gZGV0YWlscy4KPiAKPiBDaWFv
LCBUaG9yc3RlbiAod2VhcmluZyBoaXMgJ3RoZSBMaW51eCBrZXJuZWwncyByZWdyZXNzaW9uIHRy
YWNrZXInIGhhdCkKPiAtLQo+IEV2ZXJ5dGhpbmcgeW91IHdhbm5hIGtub3cgYWJvdXQgTGludXgg
a2VybmVsIHJlZ3Jlc3Npb24gdHJhY2tpbmc6Cj4gaHR0cHM6Ly9saW51eC1yZWd0cmFja2luZy5s
ZWVtaHVpcy5pbmZvL2Fib3V0LyN0bGRyCj4gVGhhdCBwYWdlIGFsc28gZXhwbGFpbnMgd2hhdCB0
byBkbyBpZiBtYWlscyBsaWtlIHRoaXMgYW5ub3kgeW91LgoKSGVsbG8sCgp0aGFuayB5b3UgZm9y
IHRoZSByZXBvcnQuIFdlIHdlcmUgYWJsZSB0byByZXByb2R1Y2UgdGhlIGlzc3VlIGFuZCBhcmUK
bm93IGludmVzdGlnYXRpbmcuCgpCYXNlZCBvZmYgb2YgY29udGV4dCB3ZSB0aGluayB0aGF0IGVl
YWM3NDA1YzczNSAoImRyYmQ6IFVzZQpzZW5kbXNnKE1TR19TUExJQ0VfUEFHRVMpIHJhdGhlciB0
aGFuIHNlbmRwYWdlKCkiKSBpcyB0aGUgY3VscHJpdC4KKFNlZSBhbHNvIHRoZSBvdGhlciByZXBs
eSBieSBUaG9tYXMgVm9lZ3RsZSwgd2hpY2ggY29uZmlybXMgdGhpcy4pCgpJJ20gYWxzbyBhZGRp
bmcgRGF2aWQgSG93ZWxscyB0byBDQywgbWF5YmUgaGUgaGFzIGFuIGlkZWEgd2hhdCBjb3VsZCBi
ZQpoYXBwZW5pbmcgaGVyZS4KCi0tIApDaHJpc3RvcGggQsO2aG13YWxkZXIKTElOQklUIHwgS2Vl
cGluZyB0aGUgRGlnaXRhbCBXb3JsZCBSdW5uaW5nCkRSQkQgSEEg4oCUICBEaXNhc3RlciBSZWNv
dmVyeSDigJQgU29mdHdhcmUgZGVmaW5lZCBTdG9yYWdlCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBs
aXN0cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2RyYmQtZGV2Cg==
