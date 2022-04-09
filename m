Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id DB28E4FA5E2
	for <lists+drbd-dev@lfdr.de>; Sat,  9 Apr 2022 10:17:02 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B4560420FCB;
	Sat,  9 Apr 2022 10:17:02 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 01371420FC1
	for <drbd-dev@lists.linbit.com>; Sat,  9 Apr 2022 10:17:01 +0200 (CEST)
Received: by mail-wr1-f49.google.com with SMTP id v2so2353118wrv.6
	for <drbd-dev@lists.linbit.com>; Sat, 09 Apr 2022 01:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=message-id:date:mime-version:user-agent:subject:content-language:to
	:cc:references:from:in-reply-to:content-transfer-encoding;
	bh=Ga61vN/TMGQoWv5pdVva9yHEVEk7JvDu8SvkqTkiHOU=;
	b=16VWXfTcecI6vKD89hlxEi4M1sM+lDWraPFKcdJek4zYvKgcUI+UTTfswq4WTG3pUA
	DwGdvejVPHmGbB6WxyxpG5RxCDgxrI8ELqeSKx9xnWZSuDqFsfTR7C0q23UBJ4NTUUke
	9rs/lGq9PScZMcSAS9SHkk+s8lIoFrVgzxTJ9NRLUES2XsBvbZXGJskPHSy0jdzHruaB
	iGqoe9YksSt5XleGcAhaVmv2OHki/8AO1/zdgDuyMqAmL6dyveVZDyPGB/rY+7+4UaaK
	b7o7nIN/SrEk1fy76OtZuySau99YX+Sryl6fYO8t+jUUvribl7KiF9nqytVWelfdH+Mk
	O4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:cc:references:from:in-reply-to
	:content-transfer-encoding;
	bh=Ga61vN/TMGQoWv5pdVva9yHEVEk7JvDu8SvkqTkiHOU=;
	b=Fu6tG3o7Ifb1GgUNEg39kyDSH1OjD9bpmyFFuOQ/nfOQ2o7O6koAEO7ZMYXLIwSVTo
	Erd9jLcoSXtbDlD3lDqLOQWB2cnUf/0vq6F22Q6l1iuXLa0VT7+huzA0snMqLCkboMWw
	CUK/NhCRSo+nJvJAETqJGGvOPsuY/Hai+wo2W1ZR+6IUfoFEJXdxhb5fOUD97lstoqMd
	BXrXpfG8YAIhaiiVDd81NeuALPhjXdD+8j9fDi6QbOl/J/FyiU05ZMelJN1yPyFrHaQb
	fe8nS9qap38ekbWx7JqypKQe9kAbO+L+9wKCOnmfG5LFALJBSmvfPFHAaJMWrPAc7lI+
	L90g==
X-Gm-Message-State: AOAM532q6P4q5JEtqlE+q62Tv/aB8OYE1Yn3h8gtPXCerC/M/XKUX+uZ
	Vvv2X0/GsM+hm6hT3KnI7srgbHNq
X-Google-Smtp-Source: ABdhPJyMl7hUdRWB67QUv24ZWK8mJRwBaxhnGq09ejE28bU5zjvkHivlidIC/JIf/EdWqVvIZNI6nA==
X-Received: by 2002:adf:9581:0:b0:1ed:c341:4ed1 with SMTP id
	p1-20020adf9581000000b001edc3414ed1mr16998132wrp.299.1649492221449;
	Sat, 09 Apr 2022 01:17:01 -0700 (PDT)
Received: from [192.168.169.127] (178.115.52.210.wireless.dyn.drei.com.
	[178.115.52.210]) by smtp.gmail.com with ESMTPSA id
	r14-20020a05600c35ce00b0038c9f469979sm12169802wmq.40.2022.04.09.01.16.59
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 09 Apr 2022 01:17:01 -0700 (PDT)
Message-ID: <5a26cdb1-b63b-8d35-640b-bc0e0f78a181@linbit.com>
Date: Sat, 9 Apr 2022 10:16:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.6.2
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
References: <20220409045043.23593-1-hch@lst.de>
	<20220409045043.23593-5-hch@lst.de>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20220409045043.23593-5-hch@lst.de>
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	dm-devel@redhat.com, target-devel@vger.kernel.org,
	linux-mtd@lists.infradead.org, drbd-dev@lists.linbit.com,
	linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-scsi@vger.kernel.org, cluster-devel@redhat.com,
	xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
	linux-um@lists.infradead.org, nbd@other.debian.org,
	linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
	ceph-devel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Drbd-dev] [PATCH 04/27] drbd: remove assign_p_sizes_qlim
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

T24gMDkuMDQuMjIgMDY6NTAsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+IEZvbGQgZWFjaCBi
cmFuY2ggaW50byBpdHMgb25seSBjYWxsZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3Bo
IEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gLS0tCj4gICBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9t
YWluLmMgfCA0NyArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMjcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4uYyBiL2RyaXZlcnMvYmxvY2svZHJiZC9k
cmJkX21haW4uYwo+IGluZGV4IDk2NzZhMWQyMTRiYzUuLjEyNjJmZTFjMzM2MTggMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbWFpbi5jCj4gKysrIGIvZHJpdmVycy9ibG9j
ay9kcmJkL2RyYmRfbWFpbi5jCj4gQEAgLTkwMywzMSArOTAzLDYgQEAgdm9pZCBkcmJkX2dlbl9h
bmRfc2VuZF9zeW5jX3V1aWQoc3RydWN0IGRyYmRfcGVlcl9kZXZpY2UgKnBlZXJfZGV2aWNlKQo+
ICAgCX0KPiAgIH0KPiAgIAo+IC0vKiBjb21tdW5pY2F0ZWQgaWYgKGFncmVlZF9mZWF0dXJlcyAm
IERSQkRfRkZfV1NBTUUpICovCj4gLXN0YXRpYyB2b2lkCj4gLWFzc2lnbl9wX3NpemVzX3FsaW0o
c3RydWN0IGRyYmRfZGV2aWNlICpkZXZpY2UsIHN0cnVjdCBwX3NpemVzICpwLAo+IC0JCQkJCXN0
cnVjdCByZXF1ZXN0X3F1ZXVlICpxKQo+IC17Cj4gLQlpZiAocSkgewo+IC0JCXAtPnFsaW0tPnBo
eXNpY2FsX2Jsb2NrX3NpemUgPSBjcHVfdG9fYmUzMihxdWV1ZV9waHlzaWNhbF9ibG9ja19zaXpl
KHEpKTsKPiAtCQlwLT5xbGltLT5sb2dpY2FsX2Jsb2NrX3NpemUgPSBjcHVfdG9fYmUzMihxdWV1
ZV9sb2dpY2FsX2Jsb2NrX3NpemUocSkpOwo+IC0JCXAtPnFsaW0tPmFsaWdubWVudF9vZmZzZXQg
PSBjcHVfdG9fYmUzMihxdWV1ZV9hbGlnbm1lbnRfb2Zmc2V0KHEpKTsKPiAtCQlwLT5xbGltLT5p
b19taW4gPSBjcHVfdG9fYmUzMihxdWV1ZV9pb19taW4ocSkpOwo+IC0JCXAtPnFsaW0tPmlvX29w
dCA9IGNwdV90b19iZTMyKHF1ZXVlX2lvX29wdChxKSk7Cj4gLQkJcC0+cWxpbS0+ZGlzY2FyZF9l
bmFibGVkID0gYmxrX3F1ZXVlX2Rpc2NhcmQocSk7Cj4gLQkJcC0+cWxpbS0+d3JpdGVfc2FtZV9j
YXBhYmxlID0gMDsKPiAtCX0gZWxzZSB7Cj4gLQkJcSA9IGRldmljZS0+cnFfcXVldWU7Cj4gLQkJ
cC0+cWxpbS0+cGh5c2ljYWxfYmxvY2tfc2l6ZSA9IGNwdV90b19iZTMyKHF1ZXVlX3BoeXNpY2Fs
X2Jsb2NrX3NpemUocSkpOwo+IC0JCXAtPnFsaW0tPmxvZ2ljYWxfYmxvY2tfc2l6ZSA9IGNwdV90
b19iZTMyKHF1ZXVlX2xvZ2ljYWxfYmxvY2tfc2l6ZShxKSk7Cj4gLQkJcC0+cWxpbS0+YWxpZ25t
ZW50X29mZnNldCA9IDA7Cj4gLQkJcC0+cWxpbS0+aW9fbWluID0gY3B1X3RvX2JlMzIocXVldWVf
aW9fbWluKHEpKTsKPiAtCQlwLT5xbGltLT5pb19vcHQgPSBjcHVfdG9fYmUzMihxdWV1ZV9pb19v
cHQocSkpOwo+IC0JCXAtPnFsaW0tPmRpc2NhcmRfZW5hYmxlZCA9IDA7Cj4gLQkJcC0+cWxpbS0+
d3JpdGVfc2FtZV9jYXBhYmxlID0gMDsKPiAtCX0KPiAtfQo+IC0KPiAgIGludCBkcmJkX3NlbmRf
c2l6ZXMoc3RydWN0IGRyYmRfcGVlcl9kZXZpY2UgKnBlZXJfZGV2aWNlLCBpbnQgdHJpZ2dlcl9y
ZXBseSwgZW51bSBkZHNfZmxhZ3MgZmxhZ3MpCj4gICB7Cj4gICAJc3RydWN0IGRyYmRfZGV2aWNl
ICpkZXZpY2UgPSBwZWVyX2RldmljZS0+ZGV2aWNlOwo+IEBAIC05NTcsMTQgKzkzMiwzMiBAQCBp
bnQgZHJiZF9zZW5kX3NpemVzKHN0cnVjdCBkcmJkX3BlZXJfZGV2aWNlICpwZWVyX2RldmljZSwg
aW50IHRyaWdnZXJfcmVwbHksIGVudQo+ICAgCQlxX29yZGVyX3R5cGUgPSBkcmJkX3F1ZXVlX29y
ZGVyX3R5cGUoZGV2aWNlKTsKPiAgIAkJbWF4X2Jpb19zaXplID0gcXVldWVfbWF4X2h3X3NlY3Rv
cnMocSkgPDwgOTsKPiAgIAkJbWF4X2Jpb19zaXplID0gbWluKG1heF9iaW9fc2l6ZSwgRFJCRF9N
QVhfQklPX1NJWkUpOwo+IC0JCWFzc2lnbl9wX3NpemVzX3FsaW0oZGV2aWNlLCBwLCBxKTsKPiAr
CQlwLT5xbGltLT5waHlzaWNhbF9ibG9ja19zaXplID0KPiArCQkJY3B1X3RvX2JlMzIocXVldWVf
cGh5c2ljYWxfYmxvY2tfc2l6ZShxKSk7Cj4gKwkJcC0+cWxpbS0+bG9naWNhbF9ibG9ja19zaXpl
ID0KPiArCQkJY3B1X3RvX2JlMzIocXVldWVfbG9naWNhbF9ibG9ja19zaXplKHEpKTsKPiArCQlw
LT5xbGltLT5hbGlnbm1lbnRfb2Zmc2V0ID0KPiArCQkJY3B1X3RvX2JlMzIocXVldWVfYWxpZ25t
ZW50X29mZnNldChxKSk7Cj4gKwkJcC0+cWxpbS0+aW9fbWluID0gY3B1X3RvX2JlMzIocXVldWVf
aW9fbWluKHEpKTsKPiArCQlwLT5xbGltLT5pb19vcHQgPSBjcHVfdG9fYmUzMihxdWV1ZV9pb19v
cHQocSkpOwo+ICsJCXAtPnFsaW0tPmRpc2NhcmRfZW5hYmxlZCA9IGJsa19xdWV1ZV9kaXNjYXJk
KHEpOwo+ICAgCQlwdXRfbGRldihkZXZpY2UpOwo+ICAgCX0gZWxzZSB7Cj4gKwkJc3RydWN0IHJl
cXVlc3RfcXVldWUgKnEgPSBkZXZpY2UtPnJxX3F1ZXVlOwo+ICsKPiArCQlwLT5xbGltLT5waHlz
aWNhbF9ibG9ja19zaXplID0KPiArCQkJY3B1X3RvX2JlMzIocXVldWVfcGh5c2ljYWxfYmxvY2tf
c2l6ZShxKSk7Cj4gKwkJcC0+cWxpbS0+bG9naWNhbF9ibG9ja19zaXplID0KPiArCQkJY3B1X3Rv
X2JlMzIocXVldWVfbG9naWNhbF9ibG9ja19zaXplKHEpKTsKPiArCQlwLT5xbGltLT5hbGlnbm1l
bnRfb2Zmc2V0ID0gMDsKPiArCQlwLT5xbGltLT5pb19taW4gPSBjcHVfdG9fYmUzMihxdWV1ZV9p
b19taW4ocSkpOwo+ICsJCXAtPnFsaW0tPmlvX29wdCA9IGNwdV90b19iZTMyKHF1ZXVlX2lvX29w
dChxKSk7Cj4gKwkJcC0+cWxpbS0+ZGlzY2FyZF9lbmFibGVkID0gMDsKPiArCj4gICAJCWRfc2l6
ZSA9IDA7Cj4gICAJCXVfc2l6ZSA9IDA7Cj4gICAJCXFfb3JkZXJfdHlwZSA9IFFVRVVFX09SREVS
RURfTk9ORTsKPiAgIAkJbWF4X2Jpb19zaXplID0gRFJCRF9NQVhfQklPX1NJWkU7IC8qIC4uLiBt
dWx0aXBsZSBCSU9zIHBlciBwZWVyX3JlcXVlc3QgKi8KPiAtCQlhc3NpZ25fcF9zaXplc19xbGlt
KGRldmljZSwgcCwgTlVMTCk7Cj4gICAJfQo+ICAgCj4gICAJaWYgKHBlZXJfZGV2aWNlLT5jb25u
ZWN0aW9uLT5hZ3JlZWRfcHJvX3ZlcnNpb24gPD0gOTQpCgpMR1RNIG5vdywgdGhhbmtzLgoKQWNr
ZWQtYnk6IENocmlzdG9waCBCw7ZobXdhbGRlciA8Y2hyaXN0b3BoLmJvZWhtd2FsZGVyQGxpbmJp
dC5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
YmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tCmh0dHBzOi8vbGlz
dHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
