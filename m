Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C43C37120AB
	for <lists+drbd-dev@lfdr.de>; Fri, 26 May 2023 09:09:01 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3327E422110;
	Fri, 26 May 2023 09:09:01 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3E41E420233
	for <drbd-dev@lists.linbit.com>; Fri, 26 May 2023 09:08:59 +0200 (CEST)
Received: by mail-wr1-f43.google.com with SMTP id
	ffacd0b85a97d-30a95ec7744so310007f8f.3
	for <drbd-dev@lists.linbit.com>; Fri, 26 May 2023 00:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20221208.gappssmtp.com; s=20221208; t=1685084938;
	x=1687676938; 
	h=user-agent:in-reply-to:content-disposition:mime-version:references
	:message-id:subject:to:from:date:from:to:cc:subject:date:message-id
	:reply-to; bh=Nt3hXBqjs4Juq50RQI8QQz9x4tLcOLVGuww8+XyuxoU=;
	b=flfcQJh9cGuTTBO6FFR5T0K1/v1NBDgT0fF3s4pqElc8crST7kcjPH9cYYl7qb5DY1
	GVuHVL4a80JpPXKAp8G58ZGhcGx8EL4HKq3+Q9f6CNsPTeWqHXqBr4EgWUU5thqy3aK3
	KHlV0Dgp/TsM7au5u2ydj6o172UxbLzWtLHwSfVqee+GTmnDLn60eYnPB/qT03pKQXxt
	vPCm5AxkM7UW/bHmifjhZAX+Ob+YFBlnNudvHlvs0smnWlXVMRWvsbrecCSX0x2mUZrt
	dMWfQHoa61EqBh38Qdx7ACo0oyU/YH1hPNrCnotkXp+ubqI8nw9C9nZspWY/TikGrHYG
	rYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20221208; t=1685084938; x=1687676938;
	h=user-agent:in-reply-to:content-disposition:mime-version:references
	:message-id:subject:to:from:date:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=Nt3hXBqjs4Juq50RQI8QQz9x4tLcOLVGuww8+XyuxoU=;
	b=NJM4+IbJZQLibNOYq2kaeshFvwibw8wQR/pS1XM2FtfS5EteQzHgIUdtlThk35vPUp
	TdVt4hOvLWRs2SbRSPJHrYULQ+VvZV+KsSZVQxaH9k6XbfW+anwAUIeOZdrt5zhrKryu
	OTKpae998RLGHNkY/6yJkbxL9Vm43t73tq9T0taZPSnwIIA6+2BrK4OHw4kx5PZdA25y
	aiNmanatqXMNMVkxBjCNm8yJUfk6zwuG2fCFyNOCWmuEDeARrUvTcKJPMY4lUD03QkGk
	ogd0pqvGLt6JQNMm0iUsRnV6rqRn/u1tvoJUpC+ybjDz129059Fs1MABD1lABuw4Bg6M
	vsyQ==
X-Gm-Message-State: AC+VfDyTB/IYpigef5TMJ1AQMv+aouBKtHI1OS4Ad2GaSrNMUc26anFi
	ornRddrRzBgYPQWlPTmTXf/CkKVBTwEJKDGVDJtaXcxb
X-Google-Smtp-Source: ACHHUZ5y6VI6nCEi0efENdtjDh4cpY/YFiOYbXiJLu1N1cWDi8MrnuLCWXtn03+eWfns0snUiXCRtA==
X-Received: by 2002:a05:6000:1102:b0:307:97dd:1de2 with SMTP id
	z2-20020a056000110200b0030797dd1de2mr517084wrw.25.1685084938481;
	Fri, 26 May 2023 00:08:58 -0700 (PDT)
Received: from localhost (static.20.139.203.116.clients.your-server.de.
	[116.203.139.20]) by smtp.gmail.com with ESMTPSA id
	s17-20020a5d69d1000000b00304adbeeabbsm4131359wrw.99.2023.05.26.00.08.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 26 May 2023 00:08:58 -0700 (PDT)
Date: Fri, 26 May 2023 09:08:57 +0200
From: Roland Kammerer <roland.kammerer@linbit.com>
To: drbd-dev@lists.linbit.com
Message-ID: <ZHBbCdV/DnhOtvmF@rck.sh>
References: <20230525144915.9031-1-kvapss@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230525144915.9031-1-kvapss@gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
Subject: Re: [Drbd-dev] [PATCH] containers: add commands to correct SELinux
 context
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On Thu, May 25, 2023 at 04:49:15PM +0200, Andrei Kvapil wrote:
> When running the entry.sh script with RAM-based module loading method, the
> generated modules acquire the 'var_lib_t' context by default on certain systems.
> 
> This patch adds commands to correct the context to 'modules_object_t'
> to allow seamless module loading on SELinux-enabled systems.
> 
> Co-developed-by: Vasily Oleynikov <vasily.oleynikov@flant.com>
> ---
>  docker/entry.sh | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/docker/entry.sh b/docker/entry.sh
> index 2c91734e6..978df6431 100644
> --- a/docker/entry.sh
> +++ b/docker/entry.sh
> @@ -217,6 +217,10 @@ load_from_ram() {
>  		find . -name "*.ko" -print0 | xargs -0 -n1 "/lib/modules/$(uname -r)/build/scripts/sign-file" "$CONFIG_MODULE_SIG_HASH" "${LB_SIGN}/signing_key.pem" "${LB_SIGN}/signing_key.x509" 
>  	fi
>  
> + 	chcon -t modules_object_t ./drbd.ko || true
> + 	chcon -t modules_object_t ./drbd_transport_tcp.ko || true
> + 	chcon -t modules_object_t ./drbd_transport_rdma.ko || true
> +
>  	insmod ./drbd.ko usermode_helper=disabled
>  	insmod ./drbd_transport_tcp.ko
>  	insmod ./drbd_transport_rdma.ko 2>/dev/null || true
> -- 
> 2.32.0 (Apple Git-132)

Thanks, I will queue that up for out of tree DRBD9.

Regards, rck
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
