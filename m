Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id E29CB38DA2A
	for <lists+drbd-dev@lfdr.de>; Sun, 23 May 2021 10:20:31 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CBF63420BCA;
	Sun, 23 May 2021 10:20:30 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4707F420BB0
	for <drbd-dev@lists.linbit.com>; Sun, 23 May 2021 10:20:29 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1621758028;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=jkWgVmeV1aDIbqHf2NWEl/RY0pR5gonwUowiZNNAcjQ=;
	b=b+KRmroRC/XnrIoT11eR1Zk2Jd7yfgwHdeYGc5z7w8i6TcEXXIvJ+uAJltYU677ItQKbcP
	lTfr+wvAFKJAAA6huplmsb7+l7hNTLV7yag5ZnXHWJBdfxMJJWQT/9Tyv1KcRDcaRBTR4d
	gH8UlaT3HpMdJlK6xi7bJ6DG0Dwlpuk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1621758028;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=jkWgVmeV1aDIbqHf2NWEl/RY0pR5gonwUowiZNNAcjQ=;
	b=5gJEAWYW4NtLrHn8NUGKKYttWxGml91Pn705UCTO6YjfUC4LqVOYzM2Ns7am/CTWT5WxK7
	TNrsYHd51WvUdFAA==
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B335CAB7C;
	Sun, 23 May 2021 08:20:28 +0000 (UTC)
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, Jim Paris <jim@jtan.com>,
	Philip Kelleher <pjk1939@linux.ibm.com>, Minchan Kim <minchan@kernel.org>, 
	Nitin Gupta <ngupta@vflare.org>, Matias Bjorling <mb@lightnvm.io>,
	Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
	Song Liu <song@kernel.org>, Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@de.ibm.com>
References: <20210521055116.1053587-1-hch@lst.de>
	<20210521055116.1053587-19-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <1a771bf9-5083-c440-f0e1-5f6920b5b017@suse.de>
Date: Sun, 23 May 2021 10:20:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210521055116.1053587-19-hch@lst.de>
Content-Language: en-US
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	linux-raid@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-s390@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-nvme@lists.infradead.org,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	linuxppc-dev@lists.ozlabs.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 18/26] nvme-multipath: convert to
 blk_alloc_disk/blk_cleanup_disk
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

T24gNS8yMS8yMSA3OjUxIEFNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBDb252ZXJ0IHRo
ZSBudm1lLW11bHRpcGF0aCBkcml2ZXIgdG8gdXNlIHRoZSBibGtfYWxsb2NfZGlzayBhbmQKPiBi
bGtfY2xlYW51cF9kaXNrIGhlbHBlcnMgdG8gc2ltcGxpZnkgZ2VuZGlzayBhbmQgcmVxdWVzdF9x
dWV1ZQo+IGFsbG9jYXRpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcg
PGhjaEBsc3QuZGU+Cj4gLS0tCj4gICBkcml2ZXJzL252ZGltbS9wbWVtLmMgICAgICAgICB8ICAx
IC0KPiAgIGRyaXZlcnMvbnZtZS9ob3N0L211bHRpcGF0aC5jIHwgNDUgKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygr
KSwgMzMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbnZkaW1tL3BtZW0u
YyBiL2RyaXZlcnMvbnZkaW1tL3BtZW0uYwo+IGluZGV4IDlmY2QwNTA4NDU2NC4uMzFmM2M0YmQ2
ZjcyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbnZkaW1tL3BtZW0uYwo+ICsrKyBiL2RyaXZlcnMv
bnZkaW1tL3BtZW0uYwo+IEBAIC00NzIsNyArNDcyLDYgQEAgc3RhdGljIGludCBwbWVtX2F0dGFj
aF9kaXNrKHN0cnVjdCBkZXZpY2UgKmRldiwKPiAgIAkJYmxrX3F1ZXVlX2ZsYWdfc2V0KFFVRVVF
X0ZMQUdfREFYLCBxKTsKPiAgIAo+ICAgCWRpc2stPmZvcHMJCT0gJnBtZW1fZm9wczsKPiAtCWRp
c2stPnF1ZXVlCQk9IHE7Cj4gICAJZGlzay0+cHJpdmF0ZV9kYXRhCT0gcG1lbTsKPiAgIAludmRp
bW1fbmFtZXNwYWNlX2Rpc2tfbmFtZShuZG5zLCBkaXNrLT5kaXNrX25hbWUpOwo+ICAgCXNldF9j
YXBhY2l0eShkaXNrLCAocG1lbS0+c2l6ZSAtIHBtZW0tPnBmbl9wYWQgLSBwbWVtLT5kYXRhX29m
ZnNldCkKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9udm1lL2hvc3QvbXVsdGlwYXRoLmMgYi9kcml2
ZXJzL252bWUvaG9zdC9tdWx0aXBhdGguYwo+IGluZGV4IGE1ZDAyZjIzNmNjYS4uYjVmYmRiNDE2
MDIyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbnZtZS9ob3N0L211bHRpcGF0aC5jCj4gKysrIGIv
ZHJpdmVycy9udm1lL2hvc3QvbXVsdGlwYXRoLmMKPiBAQCAtNDI3LDcgKzQyNyw2IEBAIHN0YXRp
YyB2b2lkIG52bWVfcmVxdWV1ZV93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKPiAgIAo+
ICAgaW50IG52bWVfbXBhdGhfYWxsb2NfZGlzayhzdHJ1Y3QgbnZtZV9jdHJsICpjdHJsLCBzdHJ1
Y3QgbnZtZV9uc19oZWFkICpoZWFkKQo+ICAgewo+IC0Jc3RydWN0IHJlcXVlc3RfcXVldWUgKnE7
Cj4gICAJYm9vbCB2d2MgPSBmYWxzZTsKPiAgIAo+ICAgCW11dGV4X2luaXQoJmhlYWQtPmxvY2sp
Owo+IEBAIC00NDMsMzMgKzQ0MiwyNCBAQCBpbnQgbnZtZV9tcGF0aF9hbGxvY19kaXNrKHN0cnVj
dCBudm1lX2N0cmwgKmN0cmwsIHN0cnVjdCBudm1lX25zX2hlYWQgKmhlYWQpCj4gICAJaWYgKCEo
Y3RybC0+c3Vic3lzLT5jbWljICYgTlZNRV9DVFJMX0NNSUNfTVVMVElfQ1RSTCkgfHwgIW11bHRp
cGF0aCkKPiAgIAkJcmV0dXJuIDA7Cj4gICAKPiAtCXEgPSBibGtfYWxsb2NfcXVldWUoY3RybC0+
bnVtYV9ub2RlKTsKPiAtCWlmICghcSkKPiAtCQlnb3RvIG91dDsKPiAtCWJsa19xdWV1ZV9mbGFn
X3NldChRVUVVRV9GTEFHX05PTlJPVCwgcSk7Cj4gLQkvKiBzZXQgdG8gYSBkZWZhdWx0IHZhbHVl
IGZvciA1MTIgdW50aWwgZGlzayBpcyB2YWxpZGF0ZWQgKi8KPiAtCWJsa19xdWV1ZV9sb2dpY2Fs
X2Jsb2NrX3NpemUocSwgNTEyKTsKPiAtCWJsa19zZXRfc3RhY2tpbmdfbGltaXRzKCZxLT5saW1p
dHMpOwo+IC0KPiAtCS8qIHdlIG5lZWQgdG8gcHJvcGFnYXRlIHVwIHRoZSBWTUMgc2V0dGluZ3Mg
Ki8KPiAtCWlmIChjdHJsLT52d2MgJiBOVk1FX0NUUkxfVldDX1BSRVNFTlQpCj4gLQkJdndjID0g
dHJ1ZTsKPiAtCWJsa19xdWV1ZV93cml0ZV9jYWNoZShxLCB2d2MsIHZ3Yyk7Cj4gLQo+IC0JaGVh
ZC0+ZGlzayA9IGFsbG9jX2Rpc2soMCk7Cj4gKwloZWFkLT5kaXNrID0gYmxrX2FsbG9jX2Rpc2so
Y3RybC0+bnVtYV9ub2RlKTsKPiAgIAlpZiAoIWhlYWQtPmRpc2spCj4gLQkJZ290byBvdXRfY2xl
YW51cF9xdWV1ZTsKPiArCQlyZXR1cm4gLUVOT01FTTsKPiAgIAloZWFkLT5kaXNrLT5mb3BzID0g
Jm52bWVfbnNfaGVhZF9vcHM7Cj4gICAJaGVhZC0+ZGlzay0+cHJpdmF0ZV9kYXRhID0gaGVhZDsK
PiAtCWhlYWQtPmRpc2stPnF1ZXVlID0gcTsKPiAgIAlzcHJpbnRmKGhlYWQtPmRpc2stPmRpc2tf
bmFtZSwgIm52bWUlZG4lZCIsCj4gICAJCQljdHJsLT5zdWJzeXMtPmluc3RhbmNlLCBoZWFkLT5p
bnN0YW5jZSk7Cj4gLQlyZXR1cm4gMDsKPiAgIAo+IC1vdXRfY2xlYW51cF9xdWV1ZToKPiAtCWJs
a19jbGVhbnVwX3F1ZXVlKHEpOwo+IC1vdXQ6Cj4gLQlyZXR1cm4gLUVOT01FTTsKPiArCWJsa19x
dWV1ZV9mbGFnX3NldChRVUVVRV9GTEFHX05PTlJPVCwgaGVhZC0+ZGlzay0+cXVldWUpOwo+ICsJ
Lyogc2V0IHRvIGEgZGVmYXVsdCB2YWx1ZSBvZiA1MTIgdW50aWwgdGhlIGRpc2sgaXMgdmFsaWRh
dGVkICovCj4gKwlibGtfcXVldWVfbG9naWNhbF9ibG9ja19zaXplKGhlYWQtPmRpc2stPnF1ZXVl
LCA1MTIpOwo+ICsJYmxrX3NldF9zdGFja2luZ19saW1pdHMoJmhlYWQtPmRpc2stPnF1ZXVlLT5s
aW1pdHMpOwo+ICsKPiArCS8qIHdlIG5lZWQgdG8gcHJvcGFnYXRlIHVwIHRoZSBWTUMgc2V0dGlu
Z3MgKi8KPiArCWlmIChjdHJsLT52d2MgJiBOVk1FX0NUUkxfVldDX1BSRVNFTlQpCj4gKwkJdndj
ID0gdHJ1ZTsKPiArCWJsa19xdWV1ZV93cml0ZV9jYWNoZShoZWFkLT5kaXNrLT5xdWV1ZSwgdndj
LCB2d2MpOwo+ICsJcmV0dXJuIDA7Cj4gICB9Cj4gICAKPiAgIHN0YXRpYyB2b2lkIG52bWVfbXBh
dGhfc2V0X2xpdmUoc3RydWN0IG52bWVfbnMgKm5zKQo+IEBAIC03NjgsMTYgKzc1OCw3IEBAIHZv
aWQgbnZtZV9tcGF0aF9yZW1vdmVfZGlzayhzdHJ1Y3QgbnZtZV9uc19oZWFkICpoZWFkKQo+ICAg
CS8qIG1ha2Ugc3VyZSBhbGwgcGVuZGluZyBiaW9zIGFyZSBjbGVhbmVkIHVwICovCj4gICAJa2Js
b2NrZF9zY2hlZHVsZV93b3JrKCZoZWFkLT5yZXF1ZXVlX3dvcmspOwo+ICAgCWZsdXNoX3dvcmso
JmhlYWQtPnJlcXVldWVfd29yayk7Cj4gLQlibGtfY2xlYW51cF9xdWV1ZShoZWFkLT5kaXNrLT5x
dWV1ZSk7Cj4gLQlpZiAoIXRlc3RfYml0KE5WTUVfTlNIRUFEX0RJU0tfTElWRSwgJmhlYWQtPmZs
YWdzKSkgewo+IC0JCS8qCj4gLQkJICogaWYgZGV2aWNlX2FkZF9kaXNrIHdhc24ndCBjYWxsZWQs
IHByZXZlbnQKPiAtCQkgKiBkaXNrIHJlbGVhc2UgdG8gcHV0IGEgYm9ndXMgcmVmZXJlbmNlIG9u
IHRoZQo+IC0JCSAqIHJlcXVlc3QgcXVldWUKPiAtCQkgKi8KPiAtCQloZWFkLT5kaXNrLT5xdWV1
ZSA9IE5VTEw7Cj4gLQl9Cj4gLQlwdXRfZGlzayhoZWFkLT5kaXNrKTsKPiArCWJsa19jbGVhbnVw
X2Rpc2soaGVhZC0+ZGlzayk7Cj4gICB9Cj4gICAKPiAgIHZvaWQgbnZtZV9tcGF0aF9pbml0X2N0
cmwoc3RydWN0IG52bWVfY3RybCAqY3RybCkKPiAKV2hhdCBhYm91dCB0aGUgY2hlY2sgZm9yIEdF
TkhEX0ZMX1VQIGEgYml0IGZ1cnRoZXIgdXAgaW4gbGluZSA3NjY/CkNhbiB0aGlzIHN0aWxsIGhh
cHBlbiB3aXRoIHRoZSBuZXcgYWxsb2NhdGlvbiBzY2hlbWUsIGllIGlzIHRoZXJlIHN0aWxsIAph
IGRpZmZlcmVuY2UgaW4gbGlmZXRpbWUgYmV0d2VlbiAtPmRpc2sgYW5kIC0+ZGlzay0+cXVldWU/
CgpDaGVlcnMsCgpIYW5uZXMKLS0gCkRyLiBIYW5uZXMgUmVpbmVja2UgICAgICAgICAgICAgICAg
S2VybmVsIFN0b3JhZ2UgQXJjaGl0ZWN0CmhhcmVAc3VzZS5kZSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICs0OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdtYkgs
IE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZwpIUkIgMzY4MDkgKEFHIE7DvHJuYmVyZyks
IEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQt
ZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlz
dGluZm8vZHJiZC1kZXYK
