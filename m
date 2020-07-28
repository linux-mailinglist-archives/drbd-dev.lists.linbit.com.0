Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B17231275
	for <lists+drbd-dev@lfdr.de>; Tue, 28 Jul 2020 21:21:22 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0C4EF4204C3;
	Tue, 28 Jul 2020 21:21:21 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 00BCE420380
	for <drbd-dev@lists.linbit.com>; Tue, 28 Jul 2020 21:21:19 +0200 (CEST)
Received: by mail-pg1-f194.google.com with SMTP id z5so12610055pgb.6
	for <drbd-dev@lists.linbit.com>; Tue, 28 Jul 2020 12:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20150623.gappssmtp.com; s=20150623;
	h=subject:from:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=6vfxP0xAICcExvQMz/4lQvBsGt+MbkdQCG7TPtmY2IU=;
	b=Y9eOezwVV/XNy3ss0E8zEQZN46Jwp7Vwk2F4dYKq4GF+o38CPH9bXtrUXOyKXIv0qi
	IxCEGapawUVePV3q40k2ellTesiBEzVplHJE1NvfhyL5RCl83HKGBpQJX0QM6eO0a6fq
	K4eY6mGRbq51nbLdHdV0aIyuHM8uJTGXUryQRTt7Lj0uw/Rn/vzZ7q/sGIcO2+P5vKXM
	D+ek+rXJ/oXKvUiOA/SsGJJtECe80pX2lqhwV2Mek5vNpO9+e9YTmFR2Dc+dekaVJzW8
	tm1bitx5pVI4Q4Wm0OEfzMIXB/vw2Lt3V5PNJbWz7GH/REb/D7Ra0sQgFciGhg/c8Ve4
	LbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=6vfxP0xAICcExvQMz/4lQvBsGt+MbkdQCG7TPtmY2IU=;
	b=MmXE7qhIeIQrring1d4xh5JKynzF6p1FOnnHOKjl8iV3UPGK3GdvM9CR6VujU0iGIC
	Msrd2t3F3+UGmaxN/BFA9+4uGFCZjaNIQ96xXL9v0Dm3NnfpYS+/FjZ1jTzw4864rnJc
	wbCLET3cpskRuW9M6j/NszGo7+FjSkDZUpToc6PhVQhEU41R+lA1PIhCuzgLZYCdGhMC
	9WdJlOcWc3cJYQUIQM82sekDFpCinUPzoCfN+xo/RonJEz/w+HUjgjL1j3BpcliGtWSI
	7U/AVFZq5fBFp9yHIuGLkl69PpuFEitdRbDXckdmNPDMc1a6/S4K3P1P3FR/EIkvoNv+
	4OvQ==
X-Gm-Message-State: AOAM530NKSurVqEPgBJ6CghVtisEgIgZwPRrH3JeXm6rjwik5pDFPC4f
	28A9of4809C+2819W11knHqA8w==
X-Google-Smtp-Source: ABdhPJxBQ70KSlhfE4UBk48wOVO+oTR3dAvGMGkYXZNgophmfDok6SYnNj9+4QpInUFKqraP2ypplA==
X-Received: by 2002:a63:3c16:: with SMTP id j22mr26658462pga.335.1595964018789;
	Tue, 28 Jul 2020 12:20:18 -0700 (PDT)
Received: from [192.168.1.182] ([66.219.217.173])
	by smtp.gmail.com with ESMTPSA id e8sm8642552pfd.34.2020.07.28.12.20.16
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 28 Jul 2020 12:20:18 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>
References: <20200724073313.138789-1-hch@lst.de>
	<0b2b59d4-da4c-33df-82b4-0d4935b91e6e@kernel.dk>
Message-ID: <08ded32a-cf3a-55b0-6a88-19d201edac93@kernel.dk>
Date: Tue, 28 Jul 2020 13:20:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0b2b59d4-da4c-33df-82b4-0d4935b91e6e@kernel.dk>
Content-Language: en-US
Cc: linux-raid@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Minchan Kim <minchan@kernel.org>, Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	cgroups@vger.kernel.org, linux-mm@kvack.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] bdi cleanups v3
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

T24gNy8yOC8yMCA5OjQxIEFNLCBKZW5zIEF4Ym9lIHdyb3RlOgo+IE9uIDcvMjQvMjAgMTozMiBB
TSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4+IEhpIEplbnMsCj4+Cj4+IHRoaXMgc2VyaWVz
IGNvbnRhaW5zIGEgYnVuY2ggb2YgZGlmZmVyZW50IEJESSBjbGVhbnVwcy4gIFRoZSBiaWdnZXN0
IGl0ZW0KPj4gaXMgdG8gaXNvbGF0ZSBibG9jayBkcml2ZXJzIGZyb20gdGhlIEJESSBpbiBwcmVw
YXJhdGlvbiBvZiBjaGFuZ2luZyB0aGUKPj4gbGlmZXRpbWUgb2YgdGhlIGJsb2NrIGRldmljZSBC
REkgaW4gYSBmb2xsb3cgdXAgc2VyaWVzLgo+IAo+IEFwcGxpZWQsIHRoYW5rcy4KCkRyb3BwZWQ6
CgogIENDICAgICAgYmxvY2svYmxrLXN5c2ZzLm8KYmxvY2svYmxrLXN5c2ZzLmM6NjA4OjE2OiBl
cnJvcjog4oCYYmxrX3Rocm90bF9zYW1wbGVfc2hvd+KAmSB1bmRlY2xhcmVkIGhlcmUgKG5vdCBp
biBhIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuIOKAmGJsa190aHJvdGxfc2FtcGxlX2VudHJ54oCZ
PwogIDYwOCB8IFFVRVVFX1JXX0VOVFJZKGJsa190aHJvdGxfc2FtcGxlLCAidGhyb3R0bGVfc2Ft
cGxlX3RpbWUiKTsKICAgICAgfCAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fgpibG9j
ay9ibGstc3lzZnMuYzo1NjM6MTA6IG5vdGU6IGluIGRlZmluaXRpb24gb2YgbWFjcm8g4oCYUVVF
VUVfUldfRU5UUlnigJkKICA1NjMgfCAgLnNob3cgPSBfcHJlZml4IyNfc2hvdywgICBcCiAgICAg
IHwgICAgICAgICAgXn5+fn5+fgpibG9jay9ibGstc3lzZnMuYzo2MDg6MTY6IGVycm9yOiDigJhi
bGtfdGhyb3RsX3NhbXBsZV9zdG9yZeKAmSB1bmRlY2xhcmVkIGhlcmUgKG5vdCBpbiBhIGZ1bmN0
aW9uKTsgZGlkIHlvdSBtZWFuIOKAmGJsa190aHJvdGxfc2FtcGxlX2VudHJ54oCZPwogIDYwOCB8
IFFVRVVFX1JXX0VOVFJZKGJsa190aHJvdGxfc2FtcGxlLCAidGhyb3R0bGVfc2FtcGxlX3RpbWUi
KTsKICAgICAgfCAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fgpibG9jay9ibGstc3lz
ZnMuYzo1NjQ6MTE6IG5vdGU6IGluIGRlZmluaXRpb24gb2YgbWFjcm8g4oCYUVVFVUVfUldfRU5U
UlnigJkKICA1NjQgfCAgLnN0b3JlID0gX3ByZWZpeCMjX3N0b3JlLCAgIFwKICAgICAgfCAgICAg
ICAgICAgXn5+fn5+fgpibG9jay9ibGstc3lzZnMuYzo2NTc6MzogZXJyb3I6IOKAmGJsa190aHJv
dGxfc2FtcGxlX3RpbWVfZW50cnnigJkgdW5kZWNsYXJlZCBoZXJlIChub3QgaW4gYSBmdW5jdGlv
bik7IGRpZCB5b3UgbWVhbiDigJhibGtfdGhyb3RsX3NhbXBsZV90aW1lX3N0b3Jl4oCZPwogIDY1
NyB8ICAmYmxrX3Rocm90bF9zYW1wbGVfdGltZV9lbnRyeS5hdHRyLAogICAgICB8ICAgXn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgogICAgICB8ICAgYmxrX3Rocm90bF9zYW1wbGVfdGltZV9z
dG9yZQpibG9jay9ibGstc3lzZnMuYzo2MDg6MTY6IHdhcm5pbmc6IOKAmGJsa190aHJvdGxfc2Ft
cGxlX2VudHJ54oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC12YXJpYWJsZV0KICA2
MDggfCBRVUVVRV9SV19FTlRSWShibGtfdGhyb3RsX3NhbXBsZSwgInRocm90dGxlX3NhbXBsZV90
aW1lIik7CiAgICAgIHwgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn4KYmxvY2svYmxr
LXN5c2ZzLmM6NTYxOjMzOiBub3RlOiBpbiBkZWZpbml0aW9uIG9mIG1hY3JvIOKAmFFVRVVFX1JX
X0VOVFJZ4oCZCiAgNTYxIHwgc3RhdGljIHN0cnVjdCBxdWV1ZV9zeXNmc19lbnRyeSBfcHJlZml4
IyNfZW50cnkgPSB7IFwKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+
fn5+fn4KbWFrZVsxXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjI4MTogYmxvY2svYmxr
LXN5c2ZzLm9dIEVycm9yIDEKbWFrZTogKioqIFtNYWtlZmlsZToxNzU2OiBibG9ja10gRXJyb3Ig
MgoKZnJvbSAiYmxvY2s6IGFkZCBoZWxwZXIgbWFjcm9zIGZvciBxdWV1ZSBzeXNmcyBlbnRyaWVz
IgoKVGhpcyBoYXMgbm90IHNlZW4gYSBmdWxsIGNvbXBpbGUgdGVzdCBldmVuLi4uCgotLSAKSmVu
cyBBeGJvZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9s
aXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
