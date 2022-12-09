Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC6564A431
	for <lists+drbd-dev@lfdr.de>; Mon, 12 Dec 2022 16:32:55 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CDCAC4202EE;
	Mon, 12 Dec 2022 16:32:54 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 342 seconds by postgrey-1.31 at mail19;
	Fri, 09 Dec 2022 13:44:01 CET
Received: from us-smtp-delivery-124.mimecast.com
	(us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BBAE2420372
	for <drbd-dev@lists.linbit.com>; Fri,  9 Dec 2022 13:44:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670589841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=kKcc7XQPg0UZn1AHNfQ4N2d5zF9JzBW3g3hPGFAB4Kc=;
	b=S0PDvxU768r2BUrXTx/xB2ztqRF8gYWOPwbvMwVWowFmzPm7cvX8yi0/49L21Ljy9Ve6NG
	XtQklc4Mv5BsFDAX1VOFzQ37/ER/LB95+ZacvY2iOToXUGoi8qKyj+eDuKWaZW8cKtjxOo
	ZKvGTAa/VAzlJcCJDmoSCfOei+ArECE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
	[209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
	us-mta-437-R8M0JWgXOoesTt1WeVaopw-1; Fri, 09 Dec 2022 07:37:14 -0500
X-MC-Unique: R8M0JWgXOoesTt1WeVaopw-1
Received: by mail-wm1-f71.google.com with SMTP id
	ay19-20020a05600c1e1300b003cf758f1617so3885986wmb.5
	for <drbd-dev@lists.linbit.com>; Fri, 09 Dec 2022 04:37:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:user-agent:references
	:in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
	:from:to:cc:subject:date:message-id:reply-to;
	bh=kKcc7XQPg0UZn1AHNfQ4N2d5zF9JzBW3g3hPGFAB4Kc=;
	b=0+Q5PGiU32ifvhawHgbN4fAOMBdiXRnzqL1l+pRvdVD+oe4GHxYO7r+UJ09wSZ886F
	ANOBmgaABb+xr7gjfRMkTuU1sJ1R7R8DBGr1syMizR/0WrRlsD3Xyu3e4AjYPAP9nUy7
	A+KZzzG8ix+5YuP7qdM7JfN2CB+dBa+awLhQmtrs4JCglllr7eUopC7n45ickx+ltpBL
	ZL/LV0Eg/ARg9Tg2xTMtmqeKI7GOkKid25bs8nB/xiGMnIki7upx4u6zafrpQgDQuHSB
	wByNGVxzRUfITuixtug6mkDqz3ozbz6ChkJA7D668f3sXMYUQWZADDg74cyDbKbTU693
	xEIA==
X-Gm-Message-State: ANoB5pkHcRZMrSWITTNoqSQUDAv7s563YOtVFYM6+ned+7ILkwH5WgOw
	koB8IZz3QM1ns8NeTkhyySwfCmHm4R+hDkEvWyGrnKe5FgHfPytyaLj56OOxIutz7cPqudBAbS/
	QJDYHO0/lvLQYT5jDWkez
X-Received: by 2002:a05:600c:4fd0:b0:3d1:c0a1:4804 with SMTP id
	o16-20020a05600c4fd000b003d1c0a14804mr4752744wmq.17.1670589432839;
	Fri, 09 Dec 2022 04:37:12 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5DyMiYpWNcqaQueb0cVh7tJ5lH4JY75MZjLcmrbwYgfM+x/au0sr5C4m2hvq8cZrZMVyWo5g==
X-Received: by 2002:a05:600c:4fd0:b0:3d1:c0a1:4804 with SMTP id
	o16-20020a05600c4fd000b003d1c0a14804mr4752714wmq.17.1670589432518;
	Fri, 09 Dec 2022 04:37:12 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-106-22.dyn.eolo.it.
	[146.241.106.22]) by smtp.gmail.com with ESMTPSA id
	j10-20020a05600c1c0a00b003b49bd61b19sm9284355wms.15.2022.12.09.04.37.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 09 Dec 2022 04:37:11 -0800 (PST)
Message-ID: <d220402a232e204676d9100d6fe4c2ae08f753ee.camel@redhat.com>
From: Paolo Abeni <pabeni@redhat.com>
To: Benjamin Coddington <bcodding@redhat.com>, netdev@vger.kernel.org
Date: Fri, 09 Dec 2022 13:37:08 +0100
In-Reply-To: <c2ec184226acd21a191ccc1aa46a1d7e43ca7104.1669036433.git.bcodding@redhat.com>
References: <cover.1669036433.git.bcodding@redhat.com>
	<c2ec184226acd21a191ccc1aa46a1d7e43ca7104.1669036433.git.bcodding@redhat.com>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Mailman-Approved-At: Mon, 12 Dec 2022 16:32:53 +0100
Cc: Latchesar Ionkov <lucho@ionkov.net>,
	samba-technical@lists.samba.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Valentina Manea <valentina.manea.m@gmail.com>,
	linux-nvme@lists.infradead.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	David Howells <dhowells@redhat.com>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Eric Dumazet <edumazet@google.com>, linux-nfs@vger.kernel.org,
	Marc Dionne <marc.dionne@auristor.com>,
	Shuah Khan <shuah@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Mike Christie <michael.christie@oracle.com>,
	drbd-dev@lists.linbit.com, linux-cifs@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>, linux-scsi@vger.kernel.org,
	Mark Fasheh <mark@fasheh.com>, linux-afs@lists.infradead.org,
	cluster-devel@redhat.com, Christine Caulfield <ccaulfie@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>, Ilya Dryomov <idryomov@gmail.com>,
	open-iscsi@googlegroups.com, Keith@linbit.com,
	Anna Schumaker <anna@kernel.org>, Hensbergen <ericvh@gmail.com>,
	"James  E.J. Bottomley" <jejb@linux.ibm.com>,
	Josef Bacik <josef@toxicpanda.com>, David@linbit.com,
	linux-block@vger.kernel.org, nbd@other.debian.org, Greg@linbit.com,
	Teigland <teigland@redhat.com>, Joel Becker <jlbec@evilplan.org>,
	v9fs-developer@lists.sourceforge.net, Busch <kbusch@kernel.org>,
	ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Jens Axboe <axboe@kernel.dk>, Chris Leech <cleech@redhat.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
	linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Steve French <sfrench@samba.org>,
	Chuck Lever <chuck.lever@oracle.com>, Lee Duncan <lduncan@suse.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, Eric@linbit.com,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Drbd-dev] [PATCH v1 2/3] Treewide: Stop corrupting socket's
	task_frag
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

T24gTW9uLCAyMDIyLTExLTIxIGF0IDA4OjM1IC0wNTAwLCBCZW5qYW1pbiBDb2RkaW5ndG9uIHdy
b3RlOgo+IFNpbmNlIG1vdmluZyB0byBtZW1hbGxvY19ub2ZzX3NhdmUvcmVzdG9yZSwgU1VOUlBD
IGhhcyBzdG9wcGVkIHNldHRpbmcgdGhlCj4gR0ZQX05PSU8gZmxhZyBvbiBza19hbGxvY2F0aW9u
IHdoaWNoIHRoZSBuZXR3b3JraW5nIHN5c3RlbSB1c2VzIHRvIGRlY2lkZQo+IHdoZW4gaXQgaXMg
c2FmZSB0byB1c2UgY3VycmVudC0+dGFza19mcmFnLiAgVGhlIHJlc3VsdHMgb2YgdGhpcyBhcmUK
PiB1bmV4cGVjdGVkIGNvcnJ1cHRpb24gaW4gdGFza19mcmFnIHdoZW4gU1VOUlBDIGlzIGludm9s
dmVkIGluIG1lbW9yeQo+IHJlY2xhaW0uCj4gCj4gVGhlIGNvcnJ1cHRpb24gY2FuIGJlIHNlZW4g
aW4gY3Jhc2hlcywgYnV0IHRoZSByb290IGNhdXNlIGlzIG9mdGVuCj4gZGlmZmljdWx0IHRvIGFz
Y2VydGFpbiBhcyBhIGNyYXNoaW5nIG1hY2hpbmUncyBzdGFjayB0cmFjZSB3aWxsIGhhdmUgbm8K
PiBldmlkZW5jZSBvZiBiZWluZyBuZWFyIE5GUyBvciBTVU5SUEMgY29kZS4gIEkgYmVsaWV2ZSB0
aGlzIHByb2JsZW0gdG8KPiBiZSBtdWNoIG1vcmUgcGVydmFzaXZlIHRoYW4gcmVwb3J0cyB0byB0
aGUgY29tbXVuaXR5IG1heSBpbmRpY2F0ZS4KPiAKPiBGaXggdGhpcyBieSBoYXZpbmcga2VybmVs
IHVzZXJzIG9mIHNvY2tldHMgdGhhdCBtYXkgY29ycnVwdCB0YXNrX2ZyYWcgZHVlCj4gdG8gcmVj
bGFpbSBzZXQgc2tfdXNlX3Rhc2tfZnJhZyA9IGZhbHNlLiAgUHJlZW1wdGl2ZWx5IGNvcnJlY3Rp
bmcgdGhpcwo+IHNpdHVhdGlvbiBmb3IgdXNlcnMgdGhhdCBzdGlsbCBzZXQgc2tfYWxsb2NhdGlv
biBhbGxvd3MgdGhlbSB0byBjb252ZXJ0IHRvCj4gbWVtYWxsb2Nfbm9mc19zYXZlL3Jlc3RvcmUg
d2l0aG91dCB0aGUgc2FtZSB1bmV4cGVjdGVkIGNvcnJ1cHRpb25zIHRoYXQgYXJlCj4gc3VyZSB0
byBmb2xsb3csIHVubGlrZWx5IHRvIHNob3cgdXAgaW4gdGVzdGluZywgYW5kIGRpZmZpY3VsdCB0
byBiaXNlY3QuCj4gCj4gQ0M6IFBoaWxpcHAgUmVpc25lciA8cGhpbGlwcC5yZWlzbmVyQGxpbmJp
dC5jb20+Cj4gQ0M6IExhcnMgRWxsZW5iZXJnIDxsYXJzLmVsbGVuYmVyZ0BsaW5iaXQuY29tPgo+
IENDOiAiQ2hyaXN0b3BoIELDtmhtd2FsZGVyIiA8Y2hyaXN0b3BoLmJvZWhtd2FsZGVyQGxpbmJp
dC5jb20+Cj4gQ0M6IEplbnMgQXhib2UgPGF4Ym9lQGtlcm5lbC5kaz4KPiBDQzogSm9zZWYgQmFj
aWsgPGpvc2VmQHRveGljcGFuZGEuY29tPgo+IENDOiBLZWl0aCBCdXNjaCA8a2J1c2NoQGtlcm5l
bC5vcmc+Cj4gQ0M6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IENDOiBTYWdpIEdy
aW1iZXJnIDxzYWdpQGdyaW1iZXJnLm1lPgo+IENDOiBMZWUgRHVuY2FuIDxsZHVuY2FuQHN1c2Uu
Y29tPgo+IENDOiBDaHJpcyBMZWVjaCA8Y2xlZWNoQHJlZGhhdC5jb20+Cj4gQ0M6IE1pa2UgQ2hy
aXN0aWUgPG1pY2hhZWwuY2hyaXN0aWVAb3JhY2xlLmNvbT4KPiBDQzogIkphbWVzIEUuSi4gQm90
dG9tbGV5IiA8amVqYkBsaW51eC5pYm0uY29tPgo+IENDOiAiTWFydGluIEsuIFBldGVyc2VuIiA8
bWFydGluLnBldGVyc2VuQG9yYWNsZS5jb20+Cj4gQ0M6IFZhbGVudGluYSBNYW5lYSA8dmFsZW50
aW5hLm1hbmVhLm1AZ21haWwuY29tPgo+IENDOiBTaHVhaCBLaGFuIDxzaHVhaEBrZXJuZWwub3Jn
Pgo+IENDOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+
IENDOiBEYXZpZCBIb3dlbGxzIDxkaG93ZWxsc0ByZWRoYXQuY29tPgo+IENDOiBNYXJjIERpb25u
ZSA8bWFyYy5kaW9ubmVAYXVyaXN0b3IuY29tPgo+IENDOiBTdGV2ZSBGcmVuY2ggPHNmcmVuY2hA
c2FtYmEub3JnPgo+IENDOiBDaHJpc3RpbmUgQ2F1bGZpZWxkIDxjY2F1bGZpZUByZWRoYXQuY29t
Pgo+IENDOiBEYXZpZCBUZWlnbGFuZCA8dGVpZ2xhbmRAcmVkaGF0LmNvbT4KPiBDQzogTWFyayBG
YXNoZWggPG1hcmtAZmFzaGVoLmNvbT4KPiBDQzogSm9lbCBCZWNrZXIgPGpsYmVjQGV2aWxwbGFu
Lm9yZz4KPiBDQzogSm9zZXBoIFFpIDxqb3NlcGgucWlAbGludXguYWxpYmFiYS5jb20+Cj4gQ0M6
IEVyaWMgVmFuIEhlbnNiZXJnZW4gPGVyaWN2aEBnbWFpbC5jb20+Cj4gQ0M6IExhdGNoZXNhciBJ
b25rb3YgPGx1Y2hvQGlvbmtvdi5uZXQ+Cj4gQ0M6IERvbWluaXF1ZSBNYXJ0aW5ldCA8YXNtYWRl
dXNAY29kZXdyZWNrLm9yZz4KPiBDQzogIkRhdmlkIFMuIE1pbGxlciIgPGRhdmVtQGRhdmVtbG9m
dC5uZXQ+Cj4gQ0M6IEVyaWMgRHVtYXpldCA8ZWR1bWF6ZXRAZ29vZ2xlLmNvbT4KPiBDQzogSmFr
dWIgS2ljaW5za2kgPGt1YmFAa2VybmVsLm9yZz4KPiBDQzogUGFvbG8gQWJlbmkgPHBhYmVuaUBy
ZWRoYXQuY29tPgo+IENDOiBJbHlhIERyeW9tb3YgPGlkcnlvbW92QGdtYWlsLmNvbT4KPiBDQzog
WGl1Ym8gTGkgPHhpdWJsaUByZWRoYXQuY29tPgo+IENDOiBDaHVjayBMZXZlciA8Y2h1Y2subGV2
ZXJAb3JhY2xlLmNvbT4KPiBDQzogSmVmZiBMYXl0b24gPGpsYXl0b25Aa2VybmVsLm9yZz4KPiBD
QzogVHJvbmQgTXlrbGVidXN0IDx0cm9uZC5teWtsZWJ1c3RAaGFtbWVyc3BhY2UuY29tPgo+IEND
OiBBbm5hIFNjaHVtYWtlciA8YW5uYUBrZXJuZWwub3JnPgo+IENDOiBkcmJkLWRldkBsaXN0cy5s
aW5iaXQuY29tCj4gQ0M6IGxpbnV4LWJsb2NrQHZnZXIua2VybmVsLm9yZwo+IENDOiBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnCj4gQ0M6IG5iZEBvdGhlci5kZWJpYW4ub3JnCj4gQ0M6IGxp
bnV4LW52bWVAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENDOiBvcGVuLWlzY3NpQGdvb2dsZWdyb3Vw
cy5jb20KPiBDQzogbGludXgtc2NzaUB2Z2VyLmtlcm5lbC5vcmcKPiBDQzogbGludXgtdXNiQHZn
ZXIua2VybmVsLm9yZwo+IENDOiBsaW51eC1hZnNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENDOiBs
aW51eC1jaWZzQHZnZXIua2VybmVsLm9yZwo+IENDOiBzYW1iYS10ZWNobmljYWxAbGlzdHMuc2Ft
YmEub3JnCj4gQ0M6IGNsdXN0ZXItZGV2ZWxAcmVkaGF0LmNvbQo+IENDOiBvY2ZzMi1kZXZlbEBv
c3Mub3JhY2xlLmNvbQo+IENDOiB2OWZzLWRldmVsb3BlckBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
PiBDQzogbmV0ZGV2QHZnZXIua2VybmVsLm9yZwo+IENDOiBjZXBoLWRldmVsQHZnZXIua2VybmVs
Lm9yZwo+IENDOiBsaW51eC1uZnNAdmdlci5rZXJuZWwub3JnCj4gCj4gU3VnZ2VzdGVkLWJ5OiBH
dWlsbGF1bWUgTmF1bHQgPGduYXVsdEByZWRoYXQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEJlbmph
bWluIENvZGRpbmd0b24gPGJjb2RkaW5nQHJlZGhhdC5jb20+CgpJIHRoaW5rIHRoaXMgaXMgdGhl
IG1vc3QgZmVhc2libGUgd2F5IG91dCBvZiB0aGUgZXhpc3RpbmcgaXNzdWUsIGFuZCBJCnRoaW5r
IHRoaXMgcGF0Y2hzZXQgc2hvdWxkIGdvIHZpYSB0aGUgbmV0d29ya2luZyB0cmVlLCB0YXJnZXRp
bmcgdGhlCkxpbnV4IDYuMi4KCklmIHNvbWVvbmUgaGFzIGRpc2FncmVlbWVudCB3aXRoIHRoZSBh
Ym92ZSwgcGxlYXNlIHNwZWFrISAKClRoYW5rcywKClBhb2xvCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxpc3QKZHJiZC1k
ZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1hbi9saXN0
aW5mby9kcmJkLWRldgo=
