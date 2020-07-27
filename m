Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BF122E8DB
	for <lists+drbd-dev@lfdr.de>; Mon, 27 Jul 2020 11:24:54 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D9FB0420473;
	Mon, 27 Jul 2020 11:24:52 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A60BE4203D0
	for <drbd-dev@lists.linbit.com>; Mon, 27 Jul 2020 11:08:48 +0200 (CEST)
Received: by mail-ed1-f49.google.com with SMTP id q4so8339440edv.13
	for <drbd-dev@lists.linbit.com>; Mon, 27 Jul 2020 02:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:cc:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=92kV2BDK+HuhLIZBMd0GG5/uXD5Mc2SRWXwoOGe2llg=;
	b=flpiU0a4eyhhe7V35z4wjrVw3KXbNE+lDzhD+bAVSETd5OfQMAYxMs3umtEHDCCreE
	0bXzxE2frIn+UuF69SOpoBfEU+ibm/BWwHkpLo/GvozRbNdgiHzA0NSD7zvZ3zuEXyOf
	ajn0BS8oWluVBt+OMvaMdGXMud+XAlOOHO5B/E76YeO8jZb82lMLRXPMJnu07FWsJ5ZU
	oifmRzwUkyWLqwmuWo4s4DgPx66X1IBSO5llnWE5ImFMaLkXWVjlSRAMYPPvY6iPChQ/
	puuTGTpXteA9XMM1KV++FP/YmpyrMQzQ0xR9jF/XcMqtzKIJ1mrgTMbWN1MWaT6KaakC
	ZQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:cc:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=92kV2BDK+HuhLIZBMd0GG5/uXD5Mc2SRWXwoOGe2llg=;
	b=Qy2OPOHbWbOJvhd4ZMf8PKr0JNIQ9Mn/u/9ybZ3Cmfvzvz/jF+OuHisj3mI/5sRxcI
	BdYpXZHPwwAAY6/VLq0BbZ+RgbL4Um9yHId41/aoUXkMXym1QcjXrIvo4dihqq0J+poe
	VNBIQOC+y8QgZEUGWfVrHyZYophWOk36nsxtF+bVnnRS1lZl+GcPX1qzSPLnXN3zl5Ui
	hncZmsguFyfD0qdfIUtICA/+PvqvFzYoaCSIVP350wt1V4gBw3xsXOzQKBP+YevfU7Wq
	x1IlZVscunal7dhEkztzD4xh1K+jRgb8AS0PFBRl+KKnrpw14Cp3PqWUW5ffkmiqERwm
	L1CA==
X-Gm-Message-State: AOAM532xM81r1yzwykxBtyGs1N2O9fIxFhf304mIAdAX62aAZQ2Rp/Sw
	yKyo6c5gBgOFqXSsMkrNVk/xFSpA2s8oLOkE
X-Google-Smtp-Source: ABdhPJzRFCzWMjhfF7+Ec5ABsRpASBCQJWq7Mb1+k/QaT2r1po9vl8p/xFurkhvROzaHESwX80LXHQ==
X-Received: by 2002:a05:6402:1d35:: with SMTP id
	dh21mr20969255edb.186.1595840927669; 
	Mon, 27 Jul 2020 02:08:47 -0700 (PDT)
Received: from [192.168.178.29] (80-110-214-17.static.upcbusiness.at.
	[80.110.214.17]) by smtp.gmail.com with ESMTPSA id
	v9sm6455774ejd.102.2020.07.27.02.08.46
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 27 Jul 2020 02:08:47 -0700 (PDT)
To: "T.J. Yang" <tjyang2001@gmail.com>
References: <CAD2GW8rEcO0rYaFbi3y8FC3ps7koyyN_ihvHZ8iRGrps_=-TFQ@mail.gmail.com>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
Message-ID: <1c55844c-a927-3ae3-e31b-a1de4addef79@linbit.com>
Date: Mon, 27 Jul 2020 11:08:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAD2GW8rEcO0rYaFbi3y8FC3ps7koyyN_ihvHZ8iRGrps_=-TFQ@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 27 Jul 2020 11:24:51 +0200
Cc: drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] Lower MIN_SPATCH_VERSION to 1.0.7 ?
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

T24gMjIuMDMuMjAgMTc6MzMsIFQuSi4gWWFuZyB3cm90ZToKPiBIaQo+IAo+IENhbsKgTUlOX1NQ
QVRDSF9WRVJTSU9OIGJlIHNldCB0byAxLjAuNyBpbiB1cHN0cmVhbSBjb2RlIGJhc2UgPwo+IAo+
IENlbnRPUyA4IG9ubHkgaGF2ZSBycG0gcGFja2FnZShjb2NjaW5lbGxlKSBmb3IgdmVyc2lvbiAx
LjAuNy4KPiBXaXRoIHZlcnNpb24gMS4wLjcgc2V0LCBJIHdhcyBhYmxlIHRvIG1ha2UgZHJiZC4K
PiAKPiBbbWVAY2VudG9zOHQwMSBkcmJkXSQgZ3JlcCBNSU5fU1BBVENIX1ZFUlNJT049ICAgCj4g
IMKgZHJiZC1rZXJuZWwtY29tcGF0L2dlbl9jb21wYXRfcGF0Y2guc2gKPiBNSU5fU1BBVENIX1ZF
UlNJT049MS4wLjcKPiBbbWVAY2VudG9zOHQwMSBkcmJkXSQgbWFrZQo+IAo+ICDCoCDCoCBDYWxs
aW5nIHRvcGxldmVsIG1ha2VmaWxlIG9mIGtlcm5lbCBzb3VyY2UgdHJlZSwgd2hpY2ggSSBiZWxp
ZXZlIGlzIGluCj4gIMKgIMKgIEtESVI9L2xpYi9tb2R1bGVzLzQuMTguMC0xODcuZWw4Lng4Nl82
NC9zb3VyY2UKPiAKPiBtYWtlIC1DIC9saWIvbW9kdWxlcy80LjE4LjAtMTg3LmVsOC54ODZfNjQv
c291cmNlIAo+ICDCoE89L2xpYi9tb2R1bGVzLzQuMTguMC0xODcuZWw4Lng4Nl82NC9idWlsZCAK
PiBNPS9idWlsZC9tZS9naXRodWIvZHJiZC9kcmJkIMKgbW9kdWxlcwo+ICDCoCBCdWlsZGluZyBt
b2R1bGVzLCBzdGFnZSAyLgo+ICDCoCBNT0RQT1NUIDIgbW9kdWxlcwo+IG12IC5kcmJkX2tlcm5l
bHJlbGVhc2UubmV3IC5kcmJkX2tlcm5lbHJlbGVhc2UKPiBNZW1vcml6aW5nIG1vZHVsZSBjb25m
aWd1cmF0aW9uIC4uLiBkb25lLgo+IFttZUBjZW50b3M4dDAxIGRyYmRdJAo+IAo+IC0tIAo+IFQu
Si4gWWFuZwo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gZHJiZC1kZXYgbWFpbGluZyBsaXN0Cj4gZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQo+
IGh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2Cj4gCgpI
aSwKClNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseSwgaXQgc2VlbXMgbGlrZSB0aGlzIGdvdCBzdHVj
ayBpbiBtb2RlcmF0aW9uLgoKVW5mb3J0dW5hdGVseSB3ZSBuZWVkIGEgcmVhbGx5IHJlY2VudCB2
ZXJzaW9uIG9mIHNwYXRjaCB3aGljaCBhbG1vc3Qgbm8gCmRpc3RyaWJ1dGlvbiBoYXMgcGFja2Fn
ZWQuIFRoaXMgaXMgaW4gcGFydCBiZWNhdXNlIHdlIHVzZSBzb21lIGZlYXR1cmVzIAp3aGljaCB3
ZSBhY3R1YWxseSByZXF1ZXN0ZWQgZnJvbSB0aGUgY29jY2luZWxsZSBkZXZlbG9wZXJzIGluIG9y
ZGVyIHRvIAptYWtlIGl0IHdvcmsgZm9yIG91ciB1c2UgY2FzZS4KCkl0IHNlZW1zIGxpa2UgeW91
IGdvdCBsdWNreSB3aXRoIHlvdXIga2VybmVsLiBSSEVMOCBoYXMgYSBwcmV0dHkgcmVjZW50IApr
ZXJuZWwsIHNvIHRoZXJlIGlzIG5vdCBhIGxvdCB0byBwYXRjaCwgc28gd2UgZG9uJ3QgdXNlIGEg
bG90IG9mIGV4b3RpYyAKbmV3IGZlYXR1cmVzLgoKVGhpcyBjaGFuZ2VzIGZvciBvbGRlciBkaXN0
cmlidXRpb25zLCBzdWNoIGFzIFJIRUw2IChhbmQgbWF5YmUgZXZlbiAKUkhFTDcpLCB3aGVyZSB0
aGVyZSBpcyBubyB3YXkgdGhhdCBpdCB3b3VsZCBldmVyIGJ1aWxkIHdpdGggYW4gc3BhdGNoIAp2
ZXJzaW9uIDwxLjAuOC4gU2luY2Ugd2UgYnVpbGQgZm9yIGxvdHMgb2YgZGlmZmVyZW50IGtlcm5l
bHMgZm9yIG91ciAKY29tbWVyY2lhbGx5IHN1cHBvcnRlZCBwYWNrYWdlcyAoMTExIGF0IHRpbWUg
b2Ygd3JpdGluZyksIHRoZSBvbGRlc3QgCnNwYXRjaCB2ZXJzaW9uIHdlIGNhbiBzYWZlbHkgc3Vw
cG9ydCBpcyAxLjAuOC4KCkhvd2V2ZXIsIHdlIGhhdmUgaW1wbGVtZW50ZWQgc29tZSBtZWFzdXJl
cyB0byBob3BlZnVsbHkgZWFzZSB0aGUgcGFpbiAKdGhhdCBjb21lcyBmcm9tIHRoaXMuIEZvciBv
bmUsIHdlIHByZS1nZW5lcmF0ZSBzb21lIGNvbXBhdCBwYXRjaGVzIGZvciAKdGhlIG1vc3QgY29t
bW9uIGRpc3RyaWJ1dGlvbnMuIFRoZXNlIGFyZSBpbmNsdWRlZCBpbiBvdXIgcmVsZWFzZSAKdGFy
YmFsbHMsIHdoaWNoIGFyZSBhdmFpbGFibGUgZnJvbSBvdXIgd2Vic2l0ZS4gSSByZWFsaXplIHRo
YXQgYmFjayBpbiAKTWFyY2ggdGhlc2UgbWF5IG5vdCBoYXZlIGJlZW4gaW5jbHVkZWQgZm9yIHlv
dXIga2VybmVsIHZlcnNpb24sIGJ1dCBJJ20gCnByZXR0eSBzdXJlIHRoZXkgYXJlIG5vdy4KClNl
Y29uZGx5LCB3ZSBoYXZlIGFsc28gaW1wbGVtZW50ZWQgYSBzZXJ2aWNlIGNhbGxlZCAiU1BBQVMi
IChzcGF0Y2ggYXMgYSAKc2VydmljZSkuIFRoaXMgaXMgYSB3ZWJzZXJ2aWNlIHdoaWNoIGNhbiBn
ZW5lcmF0ZSBhIGNvbXBhdCBwYXRjaCBmb3IgYSAKRFJCRCByZWxlYXNlIGZvciBhbnkgZ2l2ZW4g
a2VybmVsIHZlcnNpb24uIFdlIG1hZGUgdGhpcyBhdmFpbGFibGUgdG8gb3VyIApvcGVuIHNvdXJj
ZSB1c2VycyBzbyB0aGF0IGJ1aWxkaW5nIGZvciBjdXN0b20gIm9mZi1kaXN0cmlidXRpb24iIGtl
cm5lbHMgCndvdWxkIG5vdCBiZSBzdWNoIGEgbWFzc2l2ZSBwYWluLiBBZ2FpbiwgdGhpcyBpcyBv
bmx5IGF2YWlsYWJsZSBpZiB5b3UgCmJ1aWxkIGZyb20gYSByZWxlYXNlIHRhcmJhbGwgd2l0aG91
dCBtb2RpZmljYXRpb25zIHRvIHRoZSBzb3VyY2UgY29kZS4KCkFuZCBvZiBjb3Vyc2UsIHlvdSBj
YW4gbWFrZSB5b3VyIGxpZmUgdGhlIGVhc2llc3QgaWYgeW91IChvciB5b3VyIAplbXBsb3llcikg
YnV5IGEgc3VwcG9ydCBjb250cmFjdCBmcm9tIHVzLiBUaGVuIHdlIHdpbGwgYnVpbGQgdGhlIApw
YWNrYWdlcyBmb3IgeW91IGFuZCBkZWxpdmVyIHRoZW0gcmlnaHQgdG8geW91ciBkb29yc3RlcCA6
KQoKQmVzdCBSZWdhcmRzLApDaHJpc3RvcGgKCi0tIApDaHJpc3RvcGggQsO2aG13YWxkZXIKTElO
QklUIHwgS2VlcGluZyB0aGUgRGlnaXRhbCBXb3JsZCBSdW5uaW5nCkRSQkQgSEEg4oCUICBEaXNh
c3RlciBSZWNvdmVyeSDigJQgU29mdHdhcmUgZGVmaW5lZCBTdG9yYWdlCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApk
cmJkLWRldkBsaXN0cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2RyYmQtZGV2Cg==
