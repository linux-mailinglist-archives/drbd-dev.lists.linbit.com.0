Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCD563605F
	for <lists+drbd-dev@lfdr.de>; Wed, 23 Nov 2022 14:49:24 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1F8B14202F2;
	Wed, 23 Nov 2022 14:49:24 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 861884201EA
	for <drbd-dev@lists.linbit.com>; Wed, 23 Nov 2022 14:49:22 +0100 (CET)
Received: by mail-pg1-f171.google.com with SMTP id r18so16772557pgr.12
	for <drbd-dev@lists.linbit.com>; Wed, 23 Nov 2022 05:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=zrVe2HG7K4KYDuuN/nWl35U8fSffq8o7IIpF1fFkJnw=;
	b=f5JyZx5tZM8pw4jNUo0ArgCIRmBp3uAVAITbN6XSZGW7+Xu8vQbZOjD9wjgloJPHBW
	7wVM8g1nog9VscQPI+BWBTk03tTqIY3Umm2NWZ9n8YIA+3fmehkpU3RRYiCejKJwHRJW
	9U+DcMKtYmMNovvRUk7odGb2Jzr0dlzyBFTos8MiWorygAF6IHyi62PAu8qdkLjF4lyy
	Ap/sczrMwySEfqIDIYiVQKTr9lyvUGh6tk7eJjVnPKBdCP06CSw4H2E5SHNIza40xvyq
	silov/8iQ+KM4sdOMGb/1rDqZ7nWiqUJhP78RNNjNBrf3LQRnzoKr0GbZP+W1NEK1VEV
	IkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=zrVe2HG7K4KYDuuN/nWl35U8fSffq8o7IIpF1fFkJnw=;
	b=vPBY1VCqmxMErD2uomciuYHeS50ySrL6wPLCZsWhX9axcVqbjhSge8NYIxAqIhjHn+
	Ts6M6qnjguk4VIQwNpYUMPnjY/JHq0ntb5sMr8n4GZ74Jb3yCw2nZHctUbvr8rf3ebIE
	/1754OmzR5X7g1Sd+xPgq/GV/iprm7Rrm5R4j8tWA9l84ZBWN3V7W3Rn3A0BWqXymOTb
	UIALvWPqBYKB2p4f35Yo1F2UR8FXa0jgXod0bCqWVR9m65PW4JsPr2gtYDE1oKEhHWnr
	5yyzRILV3BcqxWL6l+xYJHOl7HB/1A6dKnZZqL92Qjk4ppI6Ja+aUqWrE9nvTRkAByT5
	6v9A==
X-Gm-Message-State: ANoB5plDgAUR+yUWEu5Vf4A4CxrPe46Ln3cRJ3E4aNTRcOqRex8DRBgH
	HLxbpfN8r1SPQqfzWtNkxTqU4A==
X-Google-Smtp-Source: AA0mqf7e1xKNCeTa0rWTsmWUe76k1WT/wUtiPZ8XSANCaGFuONk3yiRkZ9VZVwAK6adqjtvdG/x1Nw==
X-Received: by 2002:a63:ec10:0:b0:477:b359:f03c with SMTP id
	j16-20020a63ec10000000b00477b359f03cmr4879022pgh.32.1669211361255;
	Wed, 23 Nov 2022 05:49:21 -0800 (PST)
Received: from [192.168.1.136] ([198.8.77.157])
	by smtp.gmail.com with ESMTPSA id
	b8-20020a170903228800b0016c9e5f291bsm14481768plh.111.2022.11.23.05.49.19
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 23 Nov 2022 05:49:20 -0800 (PST)
Message-ID: <5760ca74-002a-ee41-fa46-3d8bdd5b2afe@kernel.dk>
Date: Wed, 23 Nov 2022 06:49:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
	Thunderbird/102.5.0
Content-Language: en-US
To: Wang ShaoBo <bobo.shaobowang@huawei.com>
References: <20221123020355.2470160-1-bobo.shaobowang@huawei.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20221123020355.2470160-1-bobo.shaobowang@huawei.com>
Cc: linux-block@vger.kernel.org, lars.ellenberg@linbit.com, liwei391@huawei.com,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH v3 0/2] drbd bugfix and cleanup.
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

T24gMTEvMjIvMjIgNzowM+KAr1BNLCBXYW5nIFNoYW9CbyB3cm90ZToKPiBkcmJkIGJ1Z2ZpeCBh
bmQgY2xlYW51cC4KPiAKPiB2MzoKPiAgIC0gYWRkIG91dF8qIGxhYmVsIGZvciBkZXN0cm95X3dv
cmtxdWV1ZSgpLgo+IAo+IHYyOgo+ICAgLSBhZGQgbmV3IHBhdGNoIGZvciByZW1vdmluZyB1c2Vs
ZXNzIG1lbXNldCgpLgo+IAo+IAo+IFdhbmcgU2hhb0JvICgyKToKPiAgIGRyYmQ6IHJlbW92ZSBj
YWxsIHRvIG1lbXNldCBiZWZvcmUgZnJlZSBkZXZpY2UvcmVzb3VyY2UvY29ubmVjdGlvbgo+ICAg
ZHJiZDogZGVzdHJveSB3b3JrcXVldWUgd2hlbiBkcmJkIGRldmljZSB3YXMgZnJlZWQKPiAKPiAg
ZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbWFpbi5jIHwgOSArKysrKy0tLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKClBhdGNoIDIvMiBkb2Vz
bid0IGFwcGx5IHRvIHRoZSBmb3ItNi4yL2Jsb2NrIGJyYW5jaC4gQ2FuIHlvdSByZXNwaW4KaXQ/
CgotLSAKSmVucyBBeGJvZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0cy5saW5iaXQuY29t
Cmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
