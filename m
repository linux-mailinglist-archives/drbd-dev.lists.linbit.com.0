Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 473042AD392
	for <lists+drbd-dev@lfdr.de>; Tue, 10 Nov 2020 11:23:15 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C63894207EA;
	Tue, 10 Nov 2020 11:23:06 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EAF9A420662
	for <drbd-dev@lists.linbit.com>; Tue, 10 Nov 2020 00:28:52 +0100 (CET)
Received: by mail-wm1-f46.google.com with SMTP id c9so1228840wml.5
	for <drbd-dev@lists.linbit.com>; Mon, 09 Nov 2020 15:28:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=uVd85Bl4q22td+3jSMit0FtxZJ1sJtChRiPRn7GLPMw=;
	b=FGsGb0gktZWtGFqbrdJOMqFTHcHu4fCGf/mLNlQdC7/zJQdVjrPhSxcGn5AQJUwLtc
	G3mMOYZntshf2KFWP3ok/kZ6AHu+DzG10oKqqJCHRP1Zux16Eh9fMsuT0fzbn9NN3pAl
	JcZClBvxSAHwu+r0SPXqWuxIaEhqCBaLqF9N7kkJm69uW50ivAVgx1MpTruEXunYUwrb
	7veMlBaPu1/OgFPurAPublPxqP5xlVnhblomEwOSDEeaCqHjUlCDmzFlekNICIkHpfVa
	k43iGKguBqVOnbFXBf+a1HRslASvnU/Vt75Om+Pj40G8guiICRvxDqddXyUVQhfS+Qf3
	g9PQ==
X-Gm-Message-State: AOAM530HDoX0wNhRptGIXZBp+WzovFm0lWxDQkRTU023SPpwh8JDBUWS
	GTbYqfDnlFFmDOJpnkHx8Z8=
X-Google-Smtp-Source: ABdhPJyLfZWJAVtXVvWavay6Dkz/YKClz0bIC5QMERvUePaULd58OWlCLidmjNr2cN/ZVx4HfgINbw==
X-Received: by 2002:a7b:c2f7:: with SMTP id e23mr1575766wmk.100.1604964532362; 
	Mon, 09 Nov 2020 15:28:52 -0800 (PST)
Received: from ?IPv6:2601:647:4802:9070:f26a:270b:f54c:37eb?
	([2601:647:4802:9070:f26a:270b:f54c:37eb])
	by smtp.gmail.com with ESMTPSA id
	c17sm6900728wro.19.2020.11.09.15.28.46
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 09 Nov 2020 15:28:51 -0800 (PST)
To: Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>
References: <20201106190337.1973127-1-hch@lst.de>
	<20201106190337.1973127-4-hch@lst.de>
	<1d06cdfa-a904-30be-f3ec-08ae2fa85cbd@suse.de>
	<20201109085340.GB27483@lst.de>
	<e79f9a96-ef53-d6ea-f6e7-e141bdd2e2d2@suse.de>
From: Sagi Grimberg <sagi@grimberg.me>
Message-ID: <d28042e3-3123-5dfc-d0a2-aab0012150c8@grimberg.me>
Date: Mon, 9 Nov 2020 15:28:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e79f9a96-ef53-d6ea-f6e7-e141bdd2e2d2@suse.de>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 10 Nov 2020 11:23:02 +0100
Cc: Justin Sanders <justin@coraid.com>, Mike Snitzer <snitzer@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	drbd-dev@lists.linbit.com, linux-scsi@vger.kernel.org,
	xen-devel@lists.xenproject.org, Ilya Dryomov <idryomov@gmail.com>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
	linux-raid@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
	ceph-devel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Minchan Kim <minchan@kernel.org>, linux-fsdevel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Subject: Re: [Drbd-dev] [PATCH 03/24] nvme: let
 set_capacity_revalidate_and_notify update the bdev size
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

Cj4gWyAuLiBdCj4+PiBPcmlnaW5hbGx5IG52bWUgbXVsdGlwYXRoIHdvdWxkIHVwZGF0ZS9jaGFu
Z2UgdGhlIHNpemUgb2YgdGhlIG11bHRpcGF0aAo+Pj4gZGV2aWNlIGFjY29yZGluZyB0byB0aGUg
dW5kZXJseWluZyBwYXRoIGRldmljZXMuCj4+PiBXaXRoIHRoaXMgcGF0Y2ggdGhlIHNpemUgb2Yg
dGhlIG11bHRpcGF0aCBkZXZpY2Ugd2lsbCBfbm90XyBjaGFuZ2UgaWYgCj4+PiB0aGVyZQo+Pj4g
aXMgYSBjaGFuZ2Ugb24gdGhlIHVuZGVybHlpbmcgZGV2aWNlcy4KPj4KPj4gWWVzLCBpdCB3aWxs
LsKgIFRha2UgYSBjbG9zZSBsb29rIGF0IG52bWVfdXBkYXRlX2Rpc2tfaW5mbyBhbmQgaG93IGl0
IGlzCj4+IGNhbGxlZC4KPj4KPiBPa2F5LCB0aGVuOiBXaGF0IHdvdWxkIGJlIHRoZSBjb3JyZWN0
IHdheSBvZiBoYW5kbGluZyBhIHNpemUgdXBkYXRlIGZvciAKPiBOVk1lIG11bHRpcGF0aD8KPiBB
c3N1bWluZyB3ZSdyZSBnZXR0aW5nIGFuIEFFTiBmb3IgZWFjaCBwYXRoIHNpZ25hbGxpbmcgdGhl
IHNpemUgY2hhbmdlCj4gKG9yIGEgY29udHJvbGxlciByZXNldCBsZWFkaW5nIHRvIGEgc2l6ZSBj
aGFuZ2UpLgo+IFNvIGlmIHdlJ3JlIHVwZGF0aW5nIHRoZSBzaXplIG9mIHRoZSBtdWx0aXBhdGgg
ZGV2aWNlIHRvZ2V0aGVyIHdpdGggdGhlIAo+IHBhdGggZGV2aWNlIGF0IHRoZSBmaXJzdCBBRU4v
cmVzZXQgd2UnbGwgZW5kIHVwIHdpdGggdGhlIG90aGVyIHBhdGhzIAo+IGhhdmluZyBhIGRpZmZl
cmVudCBzaXplIHRoYW4gdGhlIG11bHRpcGF0aCBkZXZpY2UgKGFuZCB0aGUgcGF0aCB3ZSd2ZSAK
PiBqdXN0IGJlZW4gdXBkYXRpbmcpLgo+IC0gRG8gd2UgY2FyZSwgb3IgY3Jvc3MgZmluZ2VycyBh
bmQgaG9wZSBmb3IgdGhlIGJlc3Q/Cj4gLSBTaG91bGRuJ3Qgd2UgZGV0ZWN0IHRoZSBjYXNlIHdo
ZXJlIHdlIHdvbid0IGdldCBhIHNpemUgdXBkYXRlIGZvciB0aGUgCj4gb3RoZXIgcGF0aHMsIG9y
LCBpbmRlZWQsIHdlIGhhdmUgYSBnZW51aW5lIGRldmljZSBzaXplIG1pc21hdGNoIGR1ZSB0byBh
IAo+IG1pc2NvbmZpZ3VyYXRpb24gb24gdGhlIHRhcmdldD8KPiAKPiBJRSBzaG91bGRuJ3Qgd2Ug
aGF2ZSBhIGZsYWcgJ3NpemUgdXBkYXRlIHBlbmRpbmcnIGZvciB0aGUgb3RoZXIgcGF0aHMsLCAK
PiB0byB0YWtlIHRoZW0gb3V0IG91ZiB1c2UgdGVtcG9yYXJpbHkgdW50aWwgdGhlIG90aGVyIEFF
TnMvcmVzZXRzIGhhdmUgCj4gYmVlbiBwcm9jZXNzZWQ/Cgp0aGUgbXBhdGggZGV2aWNlIHdpbGwg
dGFrZSB0aGUgbWluaW11bSBzaXplIGZyb20gYWxsIHRoZSBwYXRocywgdGhhdCBpcwp3aGF0IGJs
a19zdGFja19saW1pdHMgZG9lcy4gV2hlbiB0aGUgQUVOIGZvciBhbGwgdGhlIHBhdGhzIHdpbGwg
YXJyaXZlCnRoZSBtcGF0aCBzaXplIHdpbGwgdXBkYXRlLgoKTm90IHN1cmUgaG93IHRoaXMgaXMg
ZGlmZmVyZW50IHRoYW4gd2hhdCB3ZSBoYXZlIHRvZGF5Li4uCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRl
dkBsaXN0cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2RyYmQtZGV2Cg==
