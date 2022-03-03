Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F934CB7A4
	for <lists+drbd-dev@lfdr.de>; Thu,  3 Mar 2022 08:27:25 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A3A0D4205D8;
	Thu,  3 Mar 2022 08:27:24 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 40704420177
	for <drbd-dev@lists.linbit.com>; Thu,  3 Mar 2022 08:27:22 +0100 (CET)
Received: by mail-pl1-f176.google.com with SMTP id i1so3776857plr.2
	for <drbd-dev@lists.linbit.com>; Wed, 02 Mar 2022 23:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sgLnwuYIGskFjie2H2jjPO7yZK5PfHYTTkrYtctc5ws=;
	b=FXSRJXcZ2cyaSSh+RFzgN891/0EsPjQQYnYlHyt7Q6au+u55Yhw9CQjtuc/Xh+IxeA
	jmfOE8xDuyw6aNjCCweSWK23ooxkZ+FDp1vmELSXGe87/BlE9lQAJ5VCHRxCoJXheQ6e
	z0ZjBk6ntNVuChDJjKVkipnrg4PFzEOabNhKEpFBHr+LTEWxBydNvmRMp4x1CJuZdUwr
	yIPtetuwCR4pZCzLE6nNdjkyjeKTi+kDUarqoW7jVGs3qBeY6IJUgMC1jfObzr57dlqg
	9D3LdaczFYPoymDULVGPmDhvRiVgHdjXQ/LS1xahv5fAEYKipZZ05ntIAVBo2UMKI5ki
	Sw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sgLnwuYIGskFjie2H2jjPO7yZK5PfHYTTkrYtctc5ws=;
	b=Z7CaXDvWIZq0pv64+WPCu77Mg/H/ZrZkCjdaPMRF6BPLytB5AxtCndmDCnQr+EZXyL
	D7IU7U8Vs1HE21WFLt6xInqs27oF05zvAXRvFCoQj2bA+N4AbQfBmVqsBbpTHP3glj0G
	fxsNI9tKRG4JZipd0AMbe93sO+PwO7YfQClG5wLMj8qQnm9ItW/aHOctRZYojclRlHJt
	/jpRJplnW9srSAwAehw06gyXz35PXOAETJDdiZ8OxSZ1mRC7lhs8+UYJa+ljp8u7LGeR
	ogiiegctApcP2ajlMErkB2QmAfWmg5sqJ5FkW8i20Ye83JPsbo1aw1eeJsLsvjfuvOVZ
	8QUA==
X-Gm-Message-State: AOAM533vQvg8DVIbSlzwV+oyMoLXFGdmK5F7pVj0mK8u4mQaJEjV5FBq
	yunjmV9EKJo9WUOCz11Zcgs=
X-Google-Smtp-Source: ABdhPJxXZq8uo59Ohm7FMpyCTbKfTT1earKguyYxXh9VkI02LjxK1/LHoatHqlibGa3Ordge+YwobQ==
X-Received: by 2002:a17:902:9687:b0:151:7b31:9a57 with SMTP id
	n7-20020a170902968700b001517b319a57mr13723244plp.146.1646292442145;
	Wed, 02 Mar 2022 23:27:22 -0800 (PST)
Received: from ubuntu.huawei.com ([119.3.119.19])
	by smtp.googlemail.com with ESMTPSA id
	nu18-20020a17090b1b1200b001bbef4d9049sm1302089pjb.23.2022.03.02.23.27.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 02 Mar 2022 23:27:21 -0800 (PST)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: david.laight@aculab.com
Date: Thu,  3 Mar 2022 15:26:57 +0800
Message-Id: <20220303072657.11124-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <39404befad5b44b385698ff65465abe5@AcuMS.aculab.com>
References: <39404befad5b44b385698ff65465abe5@AcuMS.aculab.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org, gustavo@embeddedor.com,
	linux-iio@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
	linux@rasmusvillemoes.dk, dri-devel@lists.freedesktop.org,
	c.giuffrida@vu.nl, amd-gfx@lists.freedesktop.org,
	torvalds@linux-foundation.org, samba-technical@lists.samba.org,
	linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
	linux-arch@vger.kernel.org, linux-cifs@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-scsi@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-staging@lists.linux.dev,
	h.j.bos@vu.nl, jgg@ziepe.ca, intel-wired-lan@lists.osuosl.org,
	nouveau@lists.freedesktop.org,
	bcm-kernel-feedback-list@broadcom.com, dan.carpenter@oracle.com,
	linux-media@vger.kernel.org, keescook@chromium.org,
	arnd@arndb.de, linux-pm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, bjohannesmeyer@gmail.com,
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	christophe.jaillet@wanadoo.fr, jakobkoschel@gmail.com,
	v9fs-developer@lists.sourceforge.net,
	linux-tegra@vger.kernel.org, tglx@linutronix.de,
	andriy.shevchenko@linux.intel.com,
	linux-arm-kernel@lists.infradead.org, linux-sgx@vger.kernel.org,
	nathan@kernel.org, netdev@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, xiam0nd.tong@gmail.com,
	tipc-discussion@lists.sourceforge.net,
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-mediatek@lists.infradead.org, akpm@linux-foundation.org,
	linuxppc-dev@lists.ozlabs.org, christian.koenig@amd.com, rppt@kernel.org
Subject: Re: [Drbd-dev] [PATCH 2/6] treewide: remove using list iterator
	after loop body as a ptr
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

T24gVGh1LCAzIE1hciAyMDIyIDA0OjU4OjIzICswMDAwLCBEYXZpZCBMYWlnaHQgd3JvdGU6Cj4g
b24gMyBNYXIgMjAyMiAxMDoyNzoyOSArMDgwMCwgWGlhb21lbmcgVG9uZyB3cm90ZToKPiA+IFRo
ZSBwcm9ibGVtIGlzIHRoZSBtaXMtdXNlIG9mIGl0ZXJhdG9yIG91dHNpZGUgdGhlIGxvb3Agb24g
ZXhpdCwgYW5kCj4gPiB0aGUgaXRlcmF0b3Igd2lsbCBiZSB0aGUgSEVBRCdzIGNvbnRhaW5lcl9v
ZiBwb2ludGVyIHdoaWNoIHBvaW50ZXJzCj4gPiB0byBhIHR5cGUtY29uZnVzZWQgc3RydWN0LiBT
aWRlbm90ZTogVGhlICptaXMtdXNlKiBoZXJlIHJlZmVycyB0bwo+ID4gbWlzdGFrZWx5IGFjY2Vz
cyB0byBvdGhlciBtZW1iZXJzIG9mIHRoZSBzdHJ1Y3QsIGluc3RlYWQgb2YgdGhlCj4gPiBsaXN0
X2hlYWQgbWVtYmVyIHdoaWNoIGFjdXRhbGx5IGlzIHRoZSB2YWxpZCBIRUFELgo+Cj4gVGhlIHBy
b2JsZW0gaXMgdGhhdCB0aGUgSEVBRCdzIGNvbnRhaW5lcl9vZiBwb2ludGVyIHNob3VsZCBuZXZl
cgo+IGJlIGNhbGN1bGF0ZWQgYXQgYWxsLgo+IFRoaXMgaXMgd2hhdCBpcyBmdW5kYW1lbnRhbGx5
IGJyb2tlbiBhYm91dCB0aGUgY3VycmVudCBkZWZpbml0aW9uLgoKWWVzLCB0aGUgcnVsZSBpcyAi
dGhlIEhFQUQncyBjb250YWluZXJfb2YgcG9pbnRlciBzaG91bGQgbmV2ZXIgYmUKY2FsY3VsYXRl
ZCBhdCBhbGwgb3V0c2lkZSB0aGUgbG9vcCIsIGJ1dCBob3cgZG8geW91IG1ha2Ugc3VyZSBldmVy
eW9uZQpmb2xsb3dzIHRoaXMgcnVsZT8KRXZlcnlvbmUgbWFrZXMgbWlzdGFrZXMsIGJ1dCB3ZSBj
YW4gZWxpbWluYXRlIHRoZW0gYWxsIGZyb20gdGhlIGJlZ2lubmluZwp3aXRoIHRoZSBoZWxwIG9m
IGNvbXBpbGVyIHdoaWNoIGNhbiBjYXRjaCBzdWNoIHVzZS1hZnRlci1sb29wIHRoaW5ncy4KCj4g
PiBJT1csIHlvdSB3b3VsZCBkZXJlZmVyZW5jZSBhIChOVUxMICsgb2Zmc2V0X29mX21lbWJlcikg
YWRkcmVzcyBoZXJlLgo+Cj5XaGVyZT8KCkluIHRoZSBjYXNlIHdoZXJlIGEgZGV2ZWxvcGVyIGRv
IG5vdCBmb2xsb3dzIHRoZSBhYm92ZSBydWxlLCBhbmQgbWlzdGFrZWx5CmFjY2VzcyBhIG5vbi1s
aXN0LWhlYWQgbWVtYmVyIG9mIHRoZSBIRUFEJ3MgY29udGFpbmVyX29mIHBvaW50ZXIgb3V0c2lk
ZQp0aGUgbG9vcC4gRm9yIGV4YW1wbGU6CiAgICBzdHJ1Y3QgcmVxewogICAgICBpbnQgYTsKICAg
ICAgc3RydWN0IGxpc3RfaGVhZCBoOwogICAgfQogICAgc3RydWN0IHJlcSAqcjsKICAgIGxpc3Rf
Zm9yX2VhY2hfZW50cnkociwgSEVBRCwgaCkgewogICAgICBpZiAoci0+YSA9PSAweDEwKQogICAg
ICAgIGJyZWFrOwogICAgfQogICAgLy8gdGhlIGRldmVsb3BlciBtYWRlIGEgbWlzdGFrZTogaGUg
ZGlkbid0IHRha2UgdGhpcyBzaXR1YXRpb24gaW50bwogICAgLy8gYWNjb3VudCB3aGVyZSBhbGwg
ZW50cmllcyBpbiB0aGUgbGlzdCBhcmUgKnItPmEgIT0gMHgxMCosIGFuZCBub3cKICAgIC8vIHRo
ZSByIGlzIHRoZSBIRUFEJ3MgY29udGFpbmVyX29mIHBvaW50ZXIuIAogICAgci0+YSA9IDB4MjA7
ClRodXMgdGhlICJyLT5hID0gMHgyMCIgd291bGQgZGVyZWZlcmVuY2UgYSAoTlVMTCArIG9mZnNl
dF9vZl9tZW1iZXIpCmFkZHJlc3MgaGVyZS4KCj4gPiBQbGVhc2UgcmVtaW5kIG1lIGlmIGkgbWlz
c2VkIHNvbWV0aGluZywgdGhhbmtzLgo+ID4KPiA+IENhbiB5b3Ugc2hhcmUgeW91ciAiYWx0ZXJu
YXRpdmUgZGVmaW5pdGlvbnMiIGRldGFpbHM/IHRoYW5rcyEKPgo+IFRoZSBsb29wIHNob3VsZCBw
cm9iYWJseSB1c2UgYXMgZXh0cmEgdmFyaWFibGUgdGhhdCBwb2ludHMKPiB0byB0aGUgJ2xpc3Qg
bm9kZScgaW4gdGhlIG5leHQgc3RydWN0dXJlLgo+IFNvbWV0aGluZyBsaWtlOgo+IAlmb3IgKHh4
eCAqaXRlciA9IGhlYWQtPm5leHQ7Cj4gCQlpdGVyID09ICZoZWFkID8gKChpdGVtID0gTlVMTCks
MCkgOiAoKGl0ZW0gPSBsaXN0X2l0ZW0oaXRlciksMSkpOwo+IAkJaXRlciA9IGl0ZW0tPm1lbWJl
ci0+bmV4dCkgewo+IAkgICAuLi4KPiBXaXRoIGEgYml0IG9mIGNhc3RpbmcgeW91IGNhbiB1c2Ug
J2l0ZW0nIHRvIGhvbGQgJ2l0ZXInLgoKeW91IHN0aWxsIGNhbiBub3QgbWFrZSBzdXJlIGV2ZXJ5
b25lIGZvbGxvd3MgdGhpcyBydWxlOiAKImRvIG5vdCB1c2UgaXRlcmF0b3Igb3V0c2lkZSB0aGUg
bG9vcCIgd2l0aG91dCB0aGUgaGVscCBvZiBjb21waWxlciwKYmVjYXVzZSBpdGVtIGlzIGRlY2xh
cmVkIG91dHNpZGUgdGhlIGxvb3AuCgpCVFcsIHRvIGF2b2lkIGFtYmlndWl0ee+8jHRoZSAiYWx0
ZXJuYXRpdmUgZGVmaW5pdGlvbnMiIGhlcmUgaSBhc2tlZCBpcwpzb21ldGhpbmcgZnJvbSB5b3Ug
aW4gdGhpcyBjb250ZXh0OgoiT1RPSCB0aGVyZSBtYXkgYmUgYWx0ZXJuYXRpdmUgZGVmaW5pdGlv
bnMgdGhhdCBjYW4gYmUgdXNlZCB0byBnZXQKdGhlIGNvbXBpbGVyIChvciBvdGhlciBjb21waWxl
ci1saWtlIHRvb2xzKSB0byBkZXRlY3QgYnJva2VuIGNvZGUuCkV2ZW4gaWYgdGhlIGRlZmluaXRp
b24gY2FuJ3QgcG9zc2libHkgZ2VuZXJhdGUgYSB3b3JraW5nIGtlcnJuZWwuIgoKPiA+IAo+ID4g
PiBPVE9IIHRoZXJlIG1heSBiZSBhbHRlcm5hdGl2ZSBkZWZpbml0aW9ucyB0aGF0IGNhbiBiZSB1
c2VkIHRvIGdldAo+ID4gPiB0aGUgY29tcGlsZXIgKG9yIG90aGVyIGNvbXBpbGVyLWxpa2UgdG9v
bHMpIHRvIGRldGVjdCBicm9rZW4gY29kZS4KPiA+ID4gRXZlbiBpZiB0aGUgZGVmaW5pdGlvbiBj
YW4ndCBwb3NzaWJseSBnZW5lcmF0ZSBhIHdvcmtpbmcga2Vycm5lbC4KPiA+IAo+ID4gVGhlICJs
aXN0X2Zvcl9lYWNoX2VudHJ5X2luc2lkZShwb3MsIHR5cGUsIGhlYWQsIG1lbWJlcikiIHdheSBt
YWtlcwo+ID4gdGhlIGl0ZXJhdG9yIGludmlzaWFibGUgb3V0c2lkZSB0aGUgbG9vcCwgYW5kIHdv
dWxkIGJlIGNhdGNoZWQgYnkKPiA+IGNvbXBpbGVyIGlmIHVzZS1hZnRlci1sb29wIHRoaW5ncyBo
YXBwZW5lZC4KCj4gSXQgaXMgYWxzbyBhIGNvbXBldGUgUElUQSBmb3IgYW55dGhpbmcgZG9pbmcg
YSBzZWFyY2guCgpZb3UgbWVhbiBpdCB3b3VsZCBiZSBhIGJ1cmRlbiBvbiBzZWFyY2g/IGNhbiB5
b3Ugc2hvdyBtZSBzb21lIGV4YW1wbGVzPwoKT3IgeW91IG1lYW4gaXQgaXMgdG9vIGxvbmcgdGhl
IGxpc3RfZm9yX2VhY2hfZW50cnlfaW5zaWRlKiBzdHJpbmcgdG8gbGl2ZQppbiBvbmUgc2luZ2xl
IGxpbmUsIGFuZCBzaG91bGQgc3BpbHQgaW50byB0d28gbGluZT8gSWYgaXQgaXMgdGhlIGNhc2Us
IHRoZXJlCmFyZSAyIHdheSB0byBtaXRpZ2F0ZSBpdC4KMS4gcGFzcyBhIHNob3J0ZXIgdCBhcyBz
dHJ1Y3QgdHlwZSB0byB0aGUgbWFjcm8KMi4gYWZ0ZXIgYWxsIGxpc3RfZm9yX2VhY2hfZW50cnkg
bWFjcm9zIGJlIHJlcGxhY2VkIHdpdGgKbGlzdF9mb3JfZWFjaF9lbnRyeV9pbnNpZGUsIHJlbW92
ZSB0aGUgbGlzdF9mb3JfZWFjaF9lbnRyeSBpbXBsZW1lbnRhdGlvbnMKYW5kIHJlbmFtZSBhbGwg
bGlzdF9mb3JfZWFjaF9lbnRyeV9pbnNpZGUgdXNlIGJhY2sgdG8gdGhlIG9yaWdpbgpsaXN0X2Zv
cl9lYWNoX2VudHJ5IGluIGEgc2luZ2xlIHBhdGNoLgoKRm9yIG1lLCBpdCBpcyBhY2NlcHRhYmxl
IGFuZCBub3QgYSBzdWNoIGJpZyBwcm9ibGVtLgoKLS0KWGlhb21lbmcgVG9uZwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxp
c3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFp
bG1hbi9saXN0aW5mby9kcmJkLWRldgo=
